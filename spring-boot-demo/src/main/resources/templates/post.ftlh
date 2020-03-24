<#ftl encoding="UTF-8"/>
<#include "base.ftlh"/>
<#macro content>

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Blog Post - Start Bootstrap Template</title>

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="/public/boostrap/bootstrap.css">


        <!-- Custom styles for this template -->
        <link href="/public/css/blog-post.css" rel="stylesheet">
        <link rel="stylesheet" href="/public/css/post.css">

    </head>

    <body>

    <!-- Page Content -->
    <div class="container">

        <!-- Navigation -->

        <div class="row">

            <!-- Post Content Column -->
            <div class="col-lg-8">

                <!-- Title -->
                <div style="display: inline-block"><h1 class="mt-4">${post.header}</h1></div>

                <hr>
                <!-- Post Content -->
                <p class="lead">${post.text}</p>

                <hr>

                <#if user??>
                    <form action="/like" method="post">
                        <input type="submit" class="btn btn-light" value="like" style="width: 100px">
                    </form>
                    <!-- Comments Form -->
                    <div class="card my-4">
                        <h5 class="card-header">Leave a Comment:</h5>
                        <div class="card-body">
                            <form method="post" action="/post" >
                                <div class="form-group">
                                    <textarea class="form-control" rows="3" name="comment"></textarea>
                                </div>
                                <button type="submit" class="btn btn-light" style="background-color: #126220; color: white " >
                                    Submit
                                </button>
                            </form>
                        </div>
                    </div>

                    <!-- Single Comment -->
                    <div class="media mb-4">
                    <#if url?has_content>
                        <img class="d-flex mr-3 rounded-circle" src="${url}" alt="" width="50" height="50">
                    </#if>
                        <div class="media-body">
                            <#list comments as name,comment>
                                <h5 class="mt-0">${name}</h5>
                                <h5 class="mt-0" style="color: #adb5bd">${comment}</h5>

                            </#list>
                        </div>
                    </div>
                <#else>
                    <hr>
                    <div class="card my-4" style="align-items: center; height: 100px">
                        Only authorized users can comment and see comments
                        <a href="/login" class="btn btn-light" style="width: 100px; margin-top: 20px">Login</a>
                    </div>
                </#if>
            </div>
        </div>
    </div>

    </body>

</#macro>
<@main/>