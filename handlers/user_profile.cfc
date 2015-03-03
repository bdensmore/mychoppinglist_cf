/**
* I am a new handler
*/
component{
	property name="ormService" inject="entityService";

	// OPTIONAL HANDLER PROPERTIES
	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";
	// REST Allowed HTTP Methods Ex: this.allowedMethods = {delete='POST,DELETE',index='GET'}
	this.allowedMethods = {};

	/**
	IMPLICIT FUNCTIONS: Uncomment to use
	function preHandler( event, rc, prc, action, eventArguments ){
	}
	function postHandler( event, rc, prc, action, eventArguments ){
	}
	function aroundHandler( event, rc, prc, targetAction, eventArguments ){
		// executed targeted action
		arguments.targetAction( event );
	}
	function onMissingAction( event, rc, prc, missingAction, eventArguments ){
	}
	function onError( event, rc, prc, faultAction, exception, eventArguments ){
	}
	*/

	function new(event,rc,prc){
		prc.formAction = "user_profile.create";
		prc.first_name = "";
		prc.last_name = "";
		prc.errorView = "";
		prc.buttonTitle = "Save User Profile";

		event.setView("user_profile/new");
	}

	function create(event,rc,prc){
		user = ormService.get( "User", rc.user_id );
		userProfile = ormService.new( "UserProfile" );
		userProfile.setUser( user );
		userProfile.setFirstName( rc.first_name );
		userProfile.setLastName( rc.last_name );
		ormClearSession();
		ormService.save( userProfile );


		event.setView("user_profile/create");
	}

	function edit(event,rc,prc) {
		prc.formAction = "user_profile.update";

		user = ormService.get( "User", rc.user_id );

		prc.first_name = user.getUserProfile().getFirstName();
		prc.last_name = user.getUserProfile().getLastName();
		prc.errorView = "";
		prc.buttonTitle = "Update User Profile";

		event.setView("user_profile/edit");
	}

	function update(event,rc,prc){
		user = ormService.get( "User", rc.user_id );
		user.getUserProfile().setFirstName( rc.first_name );
		user.getUserProfile().setLastName( rc.last_name );
		ormClearSession();

		ormService.save( user );
		event.setView("user_profile/update");
	}



}
