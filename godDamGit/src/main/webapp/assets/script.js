/* 이스터에그 트리거 */  
function dis_non() {
  document.getElementsByClassName("typing_demo")[0].style.display="none";
  
}
self.setTimeout("dis_non()",3900); // 1초: 1000

//setTimeout(".typing_demo_in",2000)

/* document.body.onclick =function() {
  console.log('SCROLLING...');
  const el = document.getElementsByClassName('scrllap_ap');
  const pos = el.getBoundingClientRect();
  const selection = document.querySelector('.sections');
  sections.scrollTo(0,pos.top);
} */