class Facho::UsersController < Clearance::UsersController

  def new
    @user = User.new
    @user[:facho_jurisdiction_id] = nil
    @user[:role_id] = nil
    @jurisdictions = Jurisdiction.find_by_name('Florida').self_and_descendants.sort{|a, b| a.name == 'Florida' ? -1 : b.name == 'Florida' ? 1 : a.name <=> b.name}
  end

  def create
    jurisdiction = params[:user]["facho_jurisdiction_id"].blank? ? nil : Jurisdiction.find(params[:user]["facho_jurisdiction_id"])
    params[:user].delete("facho_jurisdiction_id")
    facho_role        = Role.find_by_id_and_application(params[:user]["role_id"], 'facho')
    public_facho_role = Role.find_by_name_and_application("Dashboard", "facho")
    @user             = User.new params[:user]
    @user.email       = @user.email.downcase
    @user.role_memberships.build(:role=>public_facho_role, :jurisdiction=>jurisdiction, :user=>@user)

    respond_to do |format|
      if @user.save
        @role_request              = RoleRequest.new()
        @role_request.requester    = @user
        @role_request.user         = @user
        @role_request.role         = facho_role
        @role_request.jurisdiction = jurisdiction
        @role_request.save
        flash[:notice] = "Thanks for signing up! An email will be sent to #{@user.email} shortly to confirm your account. Once you've confirmed you'll be able to login into the dashboard.\n\nIf you have any questions please email support@#{DOMAIN}."
        format.html { redirect_to sign_in_path }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        @user[:facho_jurisdiction_id] = jurisdiction.blank? ? nil : jurisdiction.id
        @user[:role_id] = facho_role.blank? ? nil : facho_role.id
        @selected_role = facho_role.blank? ? nil : facho_role
        @jurisdictions = Jurisdiction.find_by_name('Florida').self_and_descendants.sort{|a, b| a.name == 'Florida' ? -1 : b.name == 'Florida' ? 1 : a.name <=> b.name}
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
end