<cfoutput>

        #prc.errorView#

    <div class="row">
        #html.startform("#event.buildLink( prc.formAction )#")#
        <div class="form-group">
            <label for="first_name">First Name</label>
            <input type="text" class="form-control" id="first_name" name="first_name" placeholder="Enter First Name" value="#prc.first_name#">
        </div>
        <div class="form-group">
            <label for="Last Name">Last Name</label>
            <input type="text" class="form-control" id="last_name" name="last_name" placeholder="Enter Last Name" value="#prc.last_name#">
        </div>
        <button type="submit" class="btn btn-default">#prc.buttonTitle#</button>
        <input type="hidden" name="user_id" value="#rc.user_id#">
        #html.endform()#
    </div>
</cfoutput>
