<div class="container">
    <div class="navbar-inner">  
        
        
        <div id="registration" class="registration-box workflow-box social">
            <header>
                <h1>
                    Sign up for free
                </h1>
            </header>

            <section class="form-container">
                <div class="sidebar">
                    <div class="social-box">
                        <h2>You can also sign up with:</h2>



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

                <form id="registration-form" method="post" data-method="standard"
                      class="aui team-members-form registration-form selected">
                    <div id="id_first_name_group" class="field-group ">
                        <label for="id_first_name">
                            First name
                        </label>
                        <input id="id_first_name" type="text" class=" text" name="first_name" maxlength="30" />
                    </div>
                    <div id="id_last_name_group" class="field-group ">
                        <label for="id_last_name">
                            Last name
                        </label>

                        <input id="id_last_name" type="text" class=" text" name="last_name" maxlength="30" />
                    </div>
                    <div id="id_username_group" class="field-group ">
                        <label for="id_username">
                            Username<span class="aui-icon icon-required"></span><span class="content">required</span>
                        </label>

                        <input id="id_username" type="text" class="required text" name="username" maxlength="30" />


                        <div class="description">
                            e.g. atlassian
                        </div>
                    </div>

                    <div id="id_email_group" class="field-group ">
                        <label for="id_email">
                            Email<span class="aui-icon icon-required"></span><span class="content">required</span>
                        </label>

                        <input id="id_email" type="email" class="required text" name="email" maxlength="75" />
                    </div>
                    <div id="id_password1_group" class="field-group ">
                        <label for="id_password1">
                            Password<span class="aui-icon icon-required"></span><span class="content">required</span>
                        </label>

                        <input id="id_password1" type="password" class="required text" name="password1" />
                    </div>

                    <div id="id_password2_group" class="field-group ">
                        <label for="id_password2">
                            Password (again)<span class="aui-icon icon-required"></span><span class="content">required</span>
                        </label>

                        <input id="id_password2" type="password" class="required text" name="password2" />
                    </div>
                                    <div class="buttons-container">
                                        <div class="buttons">
                                            <button class="aui-button aui-button-primary aui-style"
                                                    type="submit">Sign up</button>
                                            <a class="cancel" href="/">Cancel</a>
                                        </div>
                                    </div>
                                    <input id="id_token" type="hidden" class=" " value="2815c719c46e47c66" name="token" />
                                    <input type="hidden" name="plan" value="5_users">
                                </form>
                            </section>
                        </div>
                    </div>
                </div>