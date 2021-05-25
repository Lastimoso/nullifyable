$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)


require "minitest/autorun"
require "minitest/spec"
require "minitest/reporters"
require "active_support"
require "active_record"
require "nullifyable"

Minitest::Reporters.use!

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")

class User < ActiveRecord::Base
  include Nullifyable
  nullify :first_name, :last_name, :external_id

  store_accessor :metadata, :external_id
end

def setup_db
  ActiveRecord::Migration.suppress_messages do
    ActiveRecord::Schema.define(:version => 1) do
      create_table :users do |t|
        t.string :email, :limit => 255, :null => false
        t.string :first_name, :limit => 100, :null => true
        t.string :last_name, :limit => 100, :null => true
        t.json :metadata, default: {}, null: false
      end
    end
  end
end

def teardown_db
  ActiveRecord::Migration.suppress_messages do
    ActiveRecord::Base.connection.tables.each do |table|
      ActiveRecord::Base.connection.drop_table(table)
    end
  end
end
