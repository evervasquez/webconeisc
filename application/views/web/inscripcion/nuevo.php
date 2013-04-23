<div class="container">
    <div class="navbar-inner">  
        
        
        <div id="registration" class="registration-box workflow-box social">
            <header>
                <h3>
                    Sign up for free
                </h3>
            </header>
            <div class="row-fluid">
            <section class="form-container">
                <div class="span1"></div>
                <div class="span6">

                <form id="registration-form" method="post" data-method="standard"  class="form-horizontal">
                    <div id="id_first_name_group" class="control-group ">
                        <label class="control-label" for="id_first_name">
                            First name
                        </label>
                        <div class="controls">
                            <input id="id_first_name" type="text" class="input-xlarge" name="first_name" maxlength="30" />
                        </div>
                    </div>
                    <div id="id_last_name_group" class="control-group ">
                        <label class="control-label" for="id_last_name">
                            Last name
                        </label>
                        <div class="controls">
                            <input id="id_last_name" type="text" class="input-xlarge" name="last_name" maxlength="30" />
                        </div>
                    </div>
                    <div id="id_username_group" class="control-group ">
                        <label for="id_username"class="control-label">
                            Username<span class="aui-icon icon-required"></span><span class="content">required</span>
                        </label>
                        <div class="controls">
                            <input id="id_username" type="text" class="required input-xlarge" name="username" maxlength="30" />
                        </div>
                    </div>

                    <div id="id_email_group" class="control-group ">
                        <label for="id_email" class="control-label">
                            Email<span class="aui-icon icon-required"></span><span class="content">required</span>
                        </label>
                        <div class="controls">
                            <input id="id_email" type="email" class="required input-xlarge" name="email" maxlength="75" />
                        </div>
                    </div>
                    <div id="id_password1_group" class="control-group ">
                        <label for="id_password1" class="control-label">
                            Password<span class="aui-icon icon-required"></span><span class="content">required</span>
                        </label>
                        <div class="controls">
                        <input id="id_password1" type="password" class="required input-xlarge" name="password1" />
                        </div>
                    </div>

                    <div id="id_password2_group" class="field-group ">
                        <label for="id_password2" class="control-label">
                            Password (again)<span class="aui-icon icon-required"></span><span class="content">required</span>
                        </label>
                        <div class="controls">
                        <input id="id_password2" type="password" class="required input-xlarge" name="password2" />
                        </div>
                    </div>
                                    <div class="form-actions">
                                        <div class="buttons">
                                            <button class="btn btn-primary" type="submit">Sign up</button>
                                            <a class="cancel btn" href="/">Cancel</a>
                                        </div>
                                    </div>
                                    <input id="id_token" type="hidden" class=" " value="2815c719c46e47c66" name="token" />
                                    <input type="hidden" name="plan" value="5_users">
                                </form>
                </div>
                <div class="span4">
                <div class="sidebar">
                    <div class="social-box">
                        <h4>You can also sign up with:</h4>



                        <ul id="social-login-forms">

                            <li>

                                <form class="connect-button" name="login" method="POST" action="/social/google/redirect/">

                                    <input type="hidden" name="next" value="/account/dispatch/">
                                    <button type="submit" class="aui-button aui-style google-button">
                                        Google
                                    </button>
                                </form>
                            </li>
                            <li>

                                <form class="connect-button" name="login" method="POST" action="/social/facebook/redirect/">

                                    <input type="hidden" name="next" value="/account/dispatch/">
                                    <button type="submit" class="aui-button aui-style facebook-button">
                                        Facebook
                                    </button>
                                </form>
                            </li>
                            <li>

                                <form class="connect-button" name="login" method="POST" action="/social/twitter/redirect/">

                                    <input type="hidden" name="next" value="/account/dispatch/">
                                    <button type="submit" class="aui-button aui-style twitter-button">
                                        Twitter
                                    </button>
                                </form>
                            </li>
                            <li>

                                <form class="connect-button" name="login" method="POST" action="/social/github/redirect/">

                                    <input type="hidden" name="next" value="/account/dispatch/">
                                    <button type="submit" class="aui-button aui-style github-button">
                                        GitHub
                                    </button>
                                </form>
                            </li>
                        </ul>


                    </div>
                </div>
                </div>
                <div class="span1"></div>
                            </section>
            </div>
                        </div>
                    </div>
                </div>