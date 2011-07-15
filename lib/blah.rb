require 'mindbody'



class Blah
  def self.creds
    return Mb::SourceCredentials.new('DriveDanceCentre', 'ddcstyle07', 14098);;
  end
  
  def self.serv
    return Mb::StaffService.new
  end
  
  def self.get_staff_serv
    st = Blah.serv
    st.src_creds = Blah.creds
    return st
  end
  
  def self.get_class_serv
    st = Mb::ClassService.new
    st.src_creds = Blah.creds
    return st
  end
  
  def self.get_sserv
    st = Mb::SaleService.new
    st.src_creds = Blah.creds
    return st
  end
end