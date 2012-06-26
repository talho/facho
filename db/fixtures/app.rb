
app = App.find_or_create_by_name('facho')

app.domains = 'facho.org' if app.domains.blank?
app.help_email = 'admins@talho.org' if app.help_email.blank?
app.root_jurisdiction = Jurisdiction.find_by_name("Florida") if app.root_jurisdiction.blank? #if this isn't defined, no worries
app.login_text = %Q{<p>The Member Dashboard is an online community where local health departments and districts with valid FACHO memberships can access documents training materials, software applications, and member forums.</p>
<p><a href="/tutorials/Registering_and_Navigating_The_PHIN_-_Manual.pdf">Click here</a> for a tutorial on registering for the Member Dashboard or call our help desk at (512) 814-2546.</p>} if app.login_text.blank?
app.logo = File.open(File.join(File.dirname(__FILE__),'..','..','app','assets','images','facho','FACHO_Logo_png.png')) if app.logo_file_name.blank?
#app.tiny_logo = File.open(Rails.root.join('app','assets','images','images','talho_header_logo.png')) if app.tiny_logo_file_name.blank? # There is no tiny logo right now
app.about_label = 'About FACHO Dashboard' if app.about_label.blank?
app.about_text = %Q{<h1>About FACHO</h1>
<p>The FACHO Dashboard is an online site providing numerous public health services, This site is owned and managed by the Texas Association of Local Health Officials.</p>
<p>You can set up contact devices to receive Phin Alerts.  Your account email is your first contact device, and you can add more addresses if you like.</p>
<p>If you encounter any problems in completing these tasks, email support at <a href="mailto:admins@talho.org">admins@talho.org</a></p>
<p>Copyright &cp; 2009 - 2011 Texas Association of Local Health Officials - All Rights Reserved</p>} if app.about_text.blank?

app.save!

