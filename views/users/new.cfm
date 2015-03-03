<cfoutput>
        #prc.errorView#

    <div class="row">
        #html.startform("#event.buildLink( prc.formAction )#")#
        <div class="form-group">
            <label for="user_name">Email Address</label>
            <input type="email" class="form-control" id="user_name" name="user_name" placeholder="Enter Email" value="#prc.user_name#">
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Enter Password" value="#prc.password#">
        </div>
        <button type="submit" class="btn btn-default">#prc.buttonTitle#</button>
        <input type="hidden" name="user_id" value="#rc.user_id#">
        #html.endform()#
    </div>
</cfoutput>
