class Tenant < ActiveRecord::Base

  # validate name subdomain presence uniquenes
  # validate subdomain RegExp /^[a-z\d]+([-_][a-z\d]+)*$/i

  after_create :create_schema

  def create_schema
    con = self.class.connection
    con.execute "CREATE SCHEMA #{subdomain}"
    sql = open("#{Rails.root}/db/structure.sql", 'r').read.gsub(/^SET search_path .*;/, '')
    scope_schema do
      con.execute sql
      con.execute "DROP TABLE schema_migrations, #{self.class.table_name}"
    end
  end

  def scope_schema *paths
    con = self.class.connection
    original_search_path = con.schema_search_path
    con.schema_search_path = [subdomain, *paths].join ','
    yield
  ensure
    con.schema_search_path = original_search_path
  end
end
