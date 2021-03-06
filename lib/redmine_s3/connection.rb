require 'S3'
module RedmineS3
  class Connection
    @@access_key_id     = nil
    @@secret_access_key  = nil
    @@bucket            = nil
    @@uri               = nil
    @@conn              = nil
    
    def self.load_options
      options = YAML::load(ERB.new(IO.read(File.join(Rails.root, 'config', 's3.yml'))).result)
      @@access_key_id     = options[Rails.env]['access_key_id']
      @@secret_access_key  = options[Rails.env]['secret_access_key']
      @@bucket            = options[Rails.env]['bucket']

      if options[Rails.env]['cname_bucket'] == true
        @@uri = "http://#{@@bucket}"
      else
        @@uri = "http://s3.amazonaws.com/#{@@bucket}"
      end
    end

    def self.establish_connection
      load_options unless @@access_key_id && @@secret_access_key
      @@conn = S3::AWSAuthConnection.new(@@access_key_id, @@secret_access_key, false)
    end

    def self.establish_auth_generator
      load_options unless @@access_key_id && @@secret_access_key
      @@qs_conn ||= S3::QueryStringAuthGenerator.new(@@access_key_id, @@secret_access_key, false)
    end

    def self.conn
      @@conn || establish_connection
    end

    def self.auth_generator
      establish_auth_generator
    end

    def self.bucket
      load_options unless @@bucket
      @@bucket
    end

    def self.uri
      load_options unless @@uri
      @@uri
    end

    def self.private_uri(filepath)
      load_options unless @@bucket
      auth_generator.get(bucket, filepath)
    end

    def self.create_bucket
      conn.create_bucket(bucket).http_response.message
    end

    def self.put(filename, data)
      conn.put(bucket, filename, data)
    end

    def self.publicly_readable!(filename)
      acl_xml = conn.get_acl(bucket, filename).object.data
      updated_acl = S3Helper.set_acl_public_read(acl_xml)
      conn.put_acl(bucket, filename, updated_acl).http_response.message
    end

    def self.delete(filename)
      conn.delete(bucket, filename)
    end
  end
end
