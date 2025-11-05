<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Không có quyền</title>
        <style>
            body {
                font-family: Segoe UI, Arial;
                background: #f4f6fb;
                color: #223;
            }

            .wrap {
                max-width: 560px;
                margin: 8vh auto;
                background: #fff;
                border: 1px solid #dde3f1;
                border-radius: 10px;
                box-shadow: 0 6px 26px rgba(28, 45, 94, .08);
                padding: 24px 28px;
            }

            .title {
                font-size: 22px;
                font-weight: 700;
                margin: 0 0 8px 0;
                color: #1e2b4a
            }

            .desc {
                margin: 0 0 16px 0;
                color: #4a5879
            }

            .actions {
                margin-top: 8px
            }

            .btn {
                display: inline-block;
                background: #4b79d8;
                color: #fff;
                border: 0;
                padding: 10px 22px;
                border-radius: 8px;
                text-decoration: none
            }

            .btn:hover {
                filter: brightness(.95)
            }
        </style>
    </head>

    <body>
        <div class="wrap">
            <div class="title">Bạn không có quyền hạn</div>
            <p class="desc">Vui lòng liên hệ quản trị viên hoặc cấp quản lý nếu bạn tin rằng đây là nhầm lẫn.</p>
            <div class="actions">
                <a class="btn" href="${requestScope.backUrl}">Quay lại</a>
            </div>
        </div>
    </body>

    </html>