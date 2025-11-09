<%-- Reusable header with Back to Home button --%>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <div class="app-header">
            <div class="container">
                <div class="left">
                    <a class="home-btn" href="${pageContext.request.contextPath}/home">&larr; Quay về trang chủ</a>
                </div>
                <div class="right">
                    <!-- place for future header items (user avatar, notifications) -->
                </div>
            </div>
        </div>
        <style>
            .app-header {
                background: transparent;
                padding: 12px 0;
                margin-bottom: 8px
            }

            .app-header .container {
                max-width: 1000px;
                margin: 0 auto;
                padding: 0 16px;
                display: flex;
                align-items: center;
                justify-content: space-between
            }

            .home-btn {
                display: inline-block;
                padding: 8px 12px;
                background: #eef2ff;
                color: #27408b;
                border-radius: 8px;
                text-decoration: none;
                font-weight: 600;
                border: 1px solid rgba(37, 99, 235, 0.12)
            }

            .home-btn:hover {
                background: #e1eaff
            }

            @media (max-width:640px) {
                .app-header .container {
                    padding: 0 12px
                }
            }
        </style>