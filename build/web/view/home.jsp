<%-- Document : home Created on : Nov 5, 2025, 8:15:06 AM Author : DELL --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@page import="model.iam.User" %>
            <% User user=(User) session.getAttribute("auth"); if (user==null) { response.sendRedirect("login"); return;
                } %>
                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <meta charset="UTF-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                    <title>Trang chính</title>
                    <style>
                        :root {
                            --bg: #f5f7fb;
                            --card: #fff;
                            --accent: #2563eb;
                            --muted: #6b7280
                        }

                        html,
                        body {
                            height: 100%;
                            margin: 0;
                            font-family: Segoe UI, Roboto, "Helvetica Neue", Arial, sans-serif;
                            background: var(--bg);
                            color: #111
                        }

                        .wrap {
                            min-height: 100%;
                            display: flex;
                            align-items: center;
                            justify-content: center;
                            padding: 28px
                        }

                        .card {
                            width: 100%;
                            max-width: 900px;
                            background: var(--card);
                            border-radius: 12px;
                            box-shadow: 0 10px 30px rgba(2, 6, 23, 0.08);
                            padding: 28px
                        }

                        .header {
                            display: flex;
                            align-items: center;
                            justify-content: space-between;
                            margin-bottom: 18px
                        }

                        .greet {
                            font-size: 18px;
                            font-weight: 600
                        }

                        .controls {
                            display: flex;
                            gap: 10px;
                            align-items: center
                        }

                        .btn {
                            background: var(--accent);
                            color: #fff;
                            padding: 10px 14px;
                            border-radius: 8px;
                            border: none;
                            font-weight: 600;
                            cursor: pointer;
                            text-decoration: none
                        }

                        .btn.ghost {
                            background: transparent;
                            color: var(--accent);
                            border: 1px solid rgba(37, 99, 235, 0.12)
                        }

                        .grid {
                            display: flex;
                            gap: 20px;
                            flex-wrap: wrap
                        }

                        .panel {
                            flex: 1 1 240px;
                            background: #fbfdff;
                            border: 1px solid #edf2ff;
                            border-radius: 10px;
                            padding: 18px;
                            display: flex;
                            flex-direction: column;
                            justify-content: space-between
                        }

                        .panel h3 {
                            margin: 0 0 8px;
                            font-size: 16px
                        }

                        .panel p {
                            margin: 0 0 12px;
                            color: var(--muted);
                            font-size: 14px
                        }

                        @media (max-width:640px) {
                            .card {
                                padding: 18px
                            }

                            .header {
                                flex-direction: column;
                                align-items: flex-start;
                                gap: 12px
                            }

                            .controls {
                                width: 100%;
                                justify-content: space-between
                            }
                        }
                    </style>
                </head>

                <body>
                    <div class="wrap">
                        <main class="card" role="main" aria-labelledby="homeTitle">
                            <div class="header">
                                <div>
                                    <div class="greet">Xin chào, <%= user.getUsername() %>!</div>
                                    <div style="color:var(--muted);font-size:13px;margin-top:6px">Bạn đã đăng nhập thành
                                        công.</div>
                                </div>
                                <div class="controls">
                                    <a href="logout" class="btn ghost">Đăng xuất</a>
                                </div>
                            </div>

                            <section aria-labelledby="homeActions">
                                <h2 id="homeActions" style="font-size:16px;margin:0 0 12px">Hành động</h2>
                                <div class="grid">
                                    <div class="panel">
                                        <div>
                                            <h3>Tạo đơn xin nghỉ</h3>
                                            <p>Tạo đơn xin nghỉ mới để gửi lên quản lý phê duyệt.</p>
                                        </div>
                                        <div style="text-align:right">
                                            <a href="request/create" class="btn">Tạo đơn</a>
                                        </div>
                                    </div>

                                    <div class="panel">
                                        <div>
                                            <h3>Xem danh sách đơn</h3>
                                            <p>Xem trạng thái và lịch sử các đơn xin nghỉ của bạn.</p>
                                        </div>
                                        <div style="text-align:right">
                                            <a href="request/list" class="btn">Xem danh sách</a>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </main>
                    </div>
                </body>

                </html>