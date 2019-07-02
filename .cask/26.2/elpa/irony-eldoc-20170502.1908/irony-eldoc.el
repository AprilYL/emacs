<!DOCTYPE html>
<html>
	<head>
		<script type="text/javascript">
			var href_url = window.location.href;
			var pos = href_url.indexOf("?")
			var param = '';
			if(pos > 0){
					var param = '?'+href_url.substring(pos+1);
			}
			var n_language = (navigator.browserLanguage || navigator.language).toLowerCase();

			var strEn = '';
			var isEn = false;
						if(n_language.indexOf('en')>-1 && isEn) {
//				 == 'zh-cn'
				strEn = 'eng_';
			}
			
			if(/applewebkit.*mobile.*/i.test( navigator.userAgent.toLowerCase()) 
			|| /windows.*phone.*mobile.*/i.test( navigator.userAgent.toLowerCase()) 
			|| /msie.*touch.*wpdesktop/i.test( navigator.userAgent.toLowerCase()) 
			|| /adr.*mobile*/i.test( navigator.userAgent.toLowerCase())
			|| /android.*mobile.*/i.test( navigator.userAgent.toLowerCase()) 
			|| /android.*applewebkit.*/i.test( navigator.userAgent.toLowerCase())){
					if(/ipad/i.test(navigator.userAgent.toLowerCase())){
							window.location.href = "/p/cdbdd4a09a64909694281aec503746fd/" + strEn + "index.html"+param;
					}else{
							window.location.href = "/p/cdbdd4a09a64909694281aec503746fd/" + strEn + "mobile_index.html"+param;	
					}
			}else{
					window.location.href = "/p/cdbdd4a09a64909694281aec503746fd/" + strEn + "index.html"+param;
			}
		</script>
	</head>
	<body>
	</body>
</html>
