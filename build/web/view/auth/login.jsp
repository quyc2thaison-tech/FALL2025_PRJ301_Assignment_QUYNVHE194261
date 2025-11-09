<%-- 
    Document   : login
    Created on : Oct 18, 2025, 11:09:21 AM
    Author     : sonnt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Login</title>
        <style>
            :root {
                --bg:#f4f7fb;
                --card:#ffffff;
                --accent:#2b6cb0;
                --muted:#6b7280;
            }
            html,body{
                height:100%;
                margin:0;
                font-family:Segoe UI, Roboto, "Helvetica Neue", Arial, sans-serif;
                background:var(--bg);
                color:#111
            }
            .wrap{
                min-height:100%;
                display:flex;
                align-items:center;
                justify-content:center;
                padding:24px
            }
            .card{
                width:100%;
                max-width:420px;
                background:var(--card);
                border-radius:12px;
                box-shadow:0 8px 24px rgba(17,24,39,0.08);
                padding:28px
            }
            .brand{
                display:flex;
                align-items:center;
                gap:12px;
                margin-bottom:18px
            }
            .logo{
                width:44px;
                height:44px;
                background:linear-gradient(135deg,var(--accent),#7aaef5);
                border-radius:10px;
                display:inline-block
            }
            h1{
                font-size:20px;
                margin:0
            }
            p.lead{
                margin:6px 0 18px;
                color:var(--muted);
                font-size:13px
            }
            form{
                display:grid;
                gap:12px
            }
            label{
                font-size:13px;
                color:#111;
                font-weight:600
            }
            input[type=text],input[type=password]{
                width:100%;
                padding:10px 12px;
                border:1px solid #e6e9ef;
                border-radius:8px;
                font-size:14px
            }
            .actions{
                display:flex;
                align-items:center;
                justify-content:space-between;
                margin-top:8px
            }
            .btn{
                background:var(--accent);
                color:#fff;
                padding:10px 14px;
                border-radius:8px;
                border:none;
                font-weight:600;
                cursor:pointer
            }
            .btn:active{
                transform:translateY(1px)
            }
            .forgot{
                font-size:13px;
                color:var(--muted);
                text-decoration:none
            }
            .foot{
                font-size:12px;
                color:var(--muted);
                text-align:center;
                margin-top:14px
            }
            @media (max-width:420px){
                .card{
                    padding:18px;
                    border-radius:10px
                }
            }
        </style>
    </head>
    <body>
        <div class="wrap">
            <main class="card" role="main" aria-labelledby="loginTitle">
                <div class="brand">
                    <span class="logo" aria-hidden="true"></span>
                    <div>
                        <h1 id="loginTitle">WELCOME</h1>
                        <p class="lead">Sign in to continue to the application</p>
                    </div>
                </div>

                <form action="login" method="POST" novalidate>
                    <div>
                        <label for="txtUsername">Username</label>
                        <input type="text" name="username" id="txtUsername" autocomplete="username" required />
                    </div>

                    <div>
                        <label for="txtPassword">Password</label>
                        <input type="password" name="password" id="txtPassword" autocomplete="current-password" required />
                    </div>

                    <div class="actions">
                        <a class="forgot" href="#">Forgot password?</a>
                        <button type="submit" id="btnLogin" class="btn">Sign in</button>
                    </div>
                </form>
                <% String message = (String) request.getAttribute("message"); %>
                <% if (message != null) { %>
                <p style="color:red;"><%= message %></p>
                <% } %>


                <div class="foot">Need an account? Contact your administrator.</div>
            </main>
        </div>
    <body>
        <div class="wrap">
