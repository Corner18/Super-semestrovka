<#ftl encoding='UTF-8'>
<#include "base.ftlh"/>
<#macro content>
    <div class="feed-container">
        <div class="feed">
            <h1>Files</h1>
            <form action="/files" method="post" name="data" id="data" enctype="multipart/form-data">
                <div id="namer">
                    <div id="namer-input">
                        <input type="file" id="file" name="file"/>
                    </div>
                </div>
                <button>Submit</button>
            </form>

        </div>
    </div>


    <script type="application/javascript">
        $("form#data").submit(function(e) {
            e.preventDefault();
            var formData = new FormData(this);

            $.ajax({
                url: '/files',
                type: 'POST',
                data: formData,
                enctype: 'multipart/form-data',
                processData: false,
                contentType: false,
                cache: false,
                success: function (data) {
                    alert(data)
                },
                cache: false,
                contentType: false,
                processData: false
            });
        });
    </script>
    <div>
        <#if message?has_content>
            <p>${message}</p>
        <#else>
        </#if>
    </div>
</#macro>
<#macro title>
    <title>Loading File</title>
</#macro>
<@main/>




