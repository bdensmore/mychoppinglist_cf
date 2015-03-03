/**
* I am a new Model Object
*/
component entityName="user" table="users" persistent=true extends="mychoppinglist.models.Base" {

    property name="id" fieldtype="id" generator="native";
    property name="user_name" column="user_name" ormtype="string";
    property name="password" column="password" ormtype="string";
    property name="last_login_date" column="last_login_date" ormtype="timestamp";

    property name="UserProfile" fieldtype="one-to-one" cfc="mychoppinglist.models.UserProfile" cascade="all" mappedBy="User";


    this.constraints = {
        "user_name" = {
            required = true,
            requiredMessage = "User Name is Required!"
        },
        "password" = {
            required = true,
            requiredMessage = "Password is Required!"
        }
    };

    public User function init(){

		return this;
	}

    function getFullName() {
        return this.getUserProfile().getFirstName() &  " " & this.getUserProfile().getLastName();
    }
}
