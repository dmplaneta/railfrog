//----------DHTML Menu Created using AllWebMenus PRO ver 5.1-#754---------------
//C:\Documents and Settings\Admin\Мои документы\rgion_menu_eng.awm
awmRelativeCorner=1;
var awmMenuName='menu';
var awmLibraryBuild=754;
var awmLibraryPath='/awmdata';
var awmImagesPath='/awmdata/menu';
var awmSupported=(navigator.appName + navigator.appVersion.substring(0,1)=="Netscape5" || document.all || document.layers || navigator.userAgent.indexOf('Opera')>-1 || navigator.userAgent.indexOf('Konqueror')>-1)?1:0;
if (awmAltUrl!='' && !awmSupported) window.location.replace(awmAltUrl);
if (awmSupported){
var nua=navigator.userAgent,scriptNo=(nua.indexOf('Chrome')>-1)?2:((nua.indexOf('Safari')>-1)?7:(nua.indexOf('Gecko')>-1)?2:((document.layers)?3:((nua.indexOf('Opera')>-1)?4:((nua.indexOf('Mac')>-1)?5:1))));
var mpi=document.location,xt="";
var mpa=mpi.protocol+"//"+mpi.host;
var mpi=mpi.protocol+"//"+mpi.host+mpi.pathname;
if(scriptNo==1){oBC=document.all.tags("BASE");if(oBC && oBC.length) if(oBC[0].href) mpi=oBC[0].href;}
while (mpi.search(/\\/)>-1) mpi=mpi.replace("\\","/");
mpi=mpi.substring(0,mpi.lastIndexOf("/")+1);
var e=document.getElementsByTagName("SCRIPT");
for (var i=0;i<e.length;i++){if (e[i].src){if (e[i].src.indexOf(awmMenuName+".js")!=-1){xt=e[i].src.split("/");if (xt[xt.length-1]==awmMenuName+".js"){xt=e[i].src.substring(0,e[i].src.length-awmMenuName.length-3);if (e[i].src.indexOf("://")!=-1){mpi=xt;}else{if(xt.substring(0,1)=="/")mpi=mpa+xt; else mpi+=xt;}}}}}
while (mpi.search(/\/\.\//)>-1) {mpi=mpi.replace("/./","/");}
var awmMenuPath=mpi.substring(0,mpi.length-1);
while (awmMenuPath.search("'")>-1) {awmMenuPath=awmMenuPath.replace("'","%27");}
document.write("<SCRIPT SRC='"+awmMenuPath+awmLibraryPath+"/awmlib"+scriptNo+".js'><\/SCRIPT>");
var n=null;
awmzindex=2;
}

var awmImageName='';
var awmPosID='regions';
var awmSubmenusFrame='';
var awmSubmenusFrameOffset;
var awmOptimize=0;
var awmComboFix=2;
var awmUseTrs=0;
var awmSepr=["0","","",""];
function awmBuildMenu(){
if (awmSupported){
awmCreateCSS(1,2,2,'#660000',n,n,'bold 14px sans-serif',n,'none','0','#000000','0px 0px 0px 0',0);
awmCreateCSS(0,2,2,'#660000',n,n,'bold 14px sans-serif',n,'none','0','#000000','0px 0px 0px 0',0);
awmCreateCSS(0,1,0,n,'#F9DDB5',n,n,n,'solid','0','#500000',0,0);
awmCreateCSS(1,2,2,'#500000','#F7CE92',n,'bold 12px Verdana',n,'solid','2','#500000','5px 5px 5px 5',0);
awmCreateCSS(0,2,2,'#500000','#F7CE92',n,'bold 14px Verdana',n,'solid','2','#500000','5px 5px 5px 5',0);
awmCreateCSS(0,1,0,n,'#F9DDB5',n,n,n,'solid','0','#BA8800',0,0);
awmCreateCSS(1,2,2,'#500000','#F7CE92',n,'bold 10px Verdana',n,'solid','2','#500000','5px 5px 5px 5',1);
awmCreateCSS(0,2,2,'#500000','#F7CE92',n,'bold 12px Verdana',n,'solid','2','#500000','5px 5px 5px 5',1);
awmCreateCSS(1,2,2,'#500000','#F7CE92',n,'bold 10px Verdana',n,'solid','2','#050000','5px 5px 5px 5',1);
awmCreateCSS(0,2,2,'#500000','#F7CE92',n,'bold 12px Verdana',n,'solid','2','#050000','5px 5px 5px 5',1);
awmCreateCSS(1,2,2,'#500000','#F7CE92',n,'bold 10px Verdana',n,'solid','2','#500000','5px 15px 5px 15',1);
awmCreateCSS(0,2,2,'#500000','#F7CE92',n,'bold 12px Verdana',n,'solid','2','#500000','5px 15px 5px 15',1);
var s0=awmCreateMenu(0,0,0,0,1,0,0,0,1,10,10,0,0,2,20,1,0,n,n,100,1,0,-15,120,0,0,1,200,200,0,0,0,"0,0,0",n,n,n,n,n,n,n,n,0,0);
it=s0.addItem(3,4,4,"Russian<br/> Federation",n,n,"","",n,n,n,n,n,0,0,2,0,0);
var s1=it.addSubmenu(0,0,5,1,2,3,2,5,5,1,0,n,n,100,-1,3,0,-1,1,200,200,1,2,"0,0,0",0);
it=s1.addItem(6,7,7,"Moscow",n,n,"","moscow_eng.html",n,n,n,"moscow_eng.html",n,0,0,2,0,0);
it=s1.addItem(6,7,7,"St-Peterburg",n,n,"","spb_eng.html",n,n,n,"spb_eng.html",n,0,0,2,0,0);
it=s1.addItem(6,7,7,"Kaliningrad",n,n,"","spb_eng.html",n,n,n,"spb_eng.html",n,0,0,2,0,0);
it=s1.addItem(6,7,7,"Tver",n,n,"","moscow_eng.html",n,n,n,"moscow_eng.html",n,0,0,2,0,0);
it=s1.addItem(6,7,7,"Belgorod",n,n,"","moscow_eng.html",n,n,n,"moscow_eng.html",n,0,0,2,0,0);
it=s1.addItem(6,7,7,"Ekaterinburg",n,n,"","ural_eng.html",n,n,n,"ural_eng.html",n,0,0,2,0,0);
it=s1.addItem(6,7,7,"Chelyabinsk",n,n,"","ural_eng.html",n,n,n,"ural_eng.html",n,0,0,2,0,0);
it=s1.addItem(6,7,7,"Abakan",n,n,"","siberia_eng.html",n,n,n,"siberia_eng.html",n,0,0,2,0,0);
it=s1.addItem(6,7,7,"Barnaul",n,n,"","siberia_eng.html",n,n,n,"siberia_eng.html",n,0,0,2,0,0);
it=s1.addItem(6,7,7,"Novosibirsk",n,n,"","siberia_eng.html",n,n,n,"siberia_eng.html",n,0,0,2,0,0);
it=s1.addItem(6,7,7,"Kemerovo",n,n,"","siberia_eng.html",n,n,n,"siberia_eng.html",n,0,0,2,0,0);
it=s1.addItem(6,7,7,"Krasnoyarsk",n,n,"","siberia_eng.html",n,n,n,"siberia_eng.html",n,0,0,2,0,0);
it=s1.addItem(6,7,7,"Tomsk",n,n,"","siberia_eng.html",n,n,n,"siberia_eng.html",n,0,0,2,0,0);
it=s0.addItem(3,4,4,"Kazakhstan",n,n,"","",n,n,n,n,n,0,0,2,0,0);
var s1=it.addSubmenu(0,0,5,1,2,3,2,5,5,1,0,n,n,100,-1,1,0,-1,1,200,200,1,2,"0,0,0",0);
it=s1.addItem(6,7,7,"Astana",n,n,"","kazakhstan_eng.html",n,n,n,"kazakhstan_eng.html",n,0,0,2,0,0);
it=s1.addItem(8,9,9,"Almaty",n,n,"","kazakhstan_eng.html",n,n,n,"kazakhstan_eng.html",n,0,0,2,0,0);
it=s0.addItem(3,4,4,"Kyrgyz<br/> Republic",n,n,"","",n,n,n,n,n,0,0,2,0,0);
var s1=it.addSubmenu(0,0,5,1,2,2,2,5,6,1,0,n,n,100,-1,2,0,-1,1,200,200,1,2,"0,0,0",0);
it=s1.addItem(6,7,7,"Bishkek",n,n,"","central_asia_eng.html",n,n,n,"central_asia_eng.html",n,0,0,2,0,0);
it=s1.addItem(10,11,11,"Osh",n,n,"","central_asia_eng.html",n,n,n,"central_asia_eng.html",n,0,0,2,0,0);
s0.pm.buildMenu();
}}
