/* $('#title').toggle(function(){
    $('input#hiddenfield').val('checked');
    alert($('input#hiddenfield').val());
  },function(){
    $('input#hiddenfield').val('');
    alert($('input#hiddenfield').val())
  })

 */

 function chk_form() {
    if(document.getElementById("title").value==''){
        alert("성명을 입력해주십시오.");
        return false;
    }
    if(document.getElementById("name").value==''){
        alert("비밀번호를 입력해주십시오.");
        return false;
    }
    if(document.getElementById("pw").value==''){
        alert("비밀번호를 입력해주십시오.");
        return false;
    }
    if(document.getElementById("content").value==''){
        alert("비밀번호를 입력해주십시오.");
        return false;
    }
    
    
    document.getElementById('frm').submit();
    }