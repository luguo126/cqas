<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--editormd.preview start  -->
    <link rel="stylesheet" href="/editormd/css/editormd.preview.min.css" />
    <link rel="stylesheet" href="/editormd/css/editormd.css" />
    <!-- <div class="content" id="content">${faq.text }</div>   ${faq.text }内容为从服务器获取的HTML-->
    <div class="content" id="content">
        <hr> <p>rewtf<strong>erwefgfewfwsvc</strong></p>
        <blockquote> <blockquote>
        <hr style="page-break-after:always;" class="page-break editormd-page-break" />
        </blockquote> </blockquote>
        <hr style="page-break-after:always;" class="page-break editormd-page-break" />
        <p>[========]<br>| | |ul<br>| —————— | —————— |<br>| | |<br>| | |</p>
        <h1 id="h1-erftewg">
            <a name="erftewg" class="reference-link"></a>
            <span class="header-link octicon octicon-link"></span>
            erftewg</h1>
        <pre><code>
            @RequestMapping(&quot;/activatemail&quot;)
            private String activatemail(String actiCode,String email){
                logger.debug(&quot;ws-----activatemail----actiCode=&quot;+actiCode+&quot; email=&quot;+email);
                Person person = new Person();
                person.setActiCode(actiCode);
                person.setMail(email);
                boolean isAc = this.personService.activatEmail(person);
                if(isAc){
                    //激活成功，3秒跳转 return &quot;activateCode&quot;;
                }else{
                    //激活失败页面
                    return &quot;activateCode&quot;;
                }
            }

            jyghjmmkghmkghm </code></pre>
        <p>```uluil,ui.,u.,uo.uokiulk</p></div>

    <script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
    <script src="/editormd/lib/marked.min.js"></script>
    <script src="/editormd/lib/prettify.min.js"></script>
    <script src="/editormd/editormd.min.js"></script>

  <script type="text/javascript">
    editormd.markdownToHTML("content",{
          htmlDecode      : "style,script,iframe",  // you can filter tags decode
            emoji           : true,
            taskList        : true,
            tex             : true,  // 默认不解析
            flowChart       : true,  // 默认不解析
            sequenceDiagram : true,  // 默认不解析
        });
  </script>
  <!--editormd.preview end  -->
