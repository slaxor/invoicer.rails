module ExampleHelperMethods
  
  def logged_in_admin
    @current_user = mock_model(User)
    @current_user.stub!(:is_author_or_admin?).and_return(true)
    @current_user.stub!(:has_permission_for?).and_return(true)
    @current_user_session = mock_model(UserSession, { :record => @current_user })
    UserSession.stub!(:find).and_return(@current_user_session)
    controller.stub!(:current_user).and_return(@current_user)
    @current_user.stub!(:role).and_return("admin")
    I18n.locale = :en
  end
  
  def set_site
    I18n.default_locale = :en
    I18n.locale = :en
    @site = Factory(:site)
    controller.request.env["HTTP_HOST"] = "mtv-urban"
    Site.stub!(:find_by_domain).and_return(@site)
    I18n.locale = :en
  end
  
end

# tiny helper to stub associations
module Spec
  module Mocks
    module Methods
      def stub_association!(association_name, methods_to_be_stubbed = {})
        mock_association = Spec::Mocks::Mock.new(association_name.to_s)
        methods_to_be_stubbed.each do |method, return_value|
          mock_association.stub!(method).and_return(return_value)
        end
        self.stub!(association_name).and_return(mock_association)
      end
    end
  end
end