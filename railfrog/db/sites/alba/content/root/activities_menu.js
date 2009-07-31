//----------DHTML Menu Created using AllWebMenus PRO ver 5.1-#754---------------
//C:\Documents and Settings\Admin\��� ���������\activities_menu.awm
var awmMenuName='activities_menu';
var awmLibraryBuild=754;
var awmLibraryPath='/awmdata';
var awmImagesPath='/awmdata/activities_menu';
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
var awmPosID='activities';
var awmSubmenusFrame='';
var awmSubmenusFrameOffset;
var awmOptimize=0;
var awmComboFix=2;
var awmUseTrs=0;
var awmSepr=["0","","",""];
function awmBuildMenu(){
if (awmSupported){
awmCreateCSS(0,1,0,n,'#F9DDB5',n,n,n,'solid','0','#BA8800',0,0);
awmCreateCSS(1,2,0,'#660000','#F7CE92',n,'12px Verdana',n,'solid','1','#EE9310','5px 5px 5px 5',1);
awmCreateCSS(0,2,0,'#660000','#F7CE92',n,'14px Verdana',n,'solid','1','#EE9310','5px 5px 5px 5',1);
awmCreateCSS(0,2,0,'#660000','#F7CE92',n,'14px Verdana',n,'solid','0','#E6B300','5px 5px 5px 5',1);
awmCreateCSS(0,2,0,'#660000','#F7CE92',n,'14px Verdana',n,'solid','0','#FFE794','5px 5px 5px 5',1);
var s0=awmCreateMenu(0,0,0,0,1,0,0,5,0,10,10,1,0,0,20,1,0,n,n,100,1,0,0,0,0,0,1,200,200,0,0,1,"0,0,0",n,n,n,n,n,n,n,n,0,0);
it=s0.addItem(1,2,2,"Наша компания",n,n,"","company_rus.html",n,n,n,"company_rus.html",n,0,0,2,0,0);
it=s0.addItem(1,2,2,"Наша практика",n,n,"","practice_rus.html",n,n,n,"practice_rus.html",n,0,0,2,0,0);
var s1=it.addSubmenu(0,0,-1,1,1,0,1,0,5,1,0,n,n,100,-1,1,0,-1,1,200,200,1,1,"0,0,0",0);
it=s1.addItem(1,2,2,"Сопровождение <br /> инвестиционных проектов в <br/>  различных регионах Российской <br/> Федерации и СНГ","Сопровождение <br /> инвестиционных проектов в <br/>  различных регионах Российской <br /> Федерации и СНГ","Сопровождение <br /> инвестиционных проектов в <br/>  различных регионах Российской <br />Федерации и СНГ","","practice_maintain_rus.html",n,n,n,"practice_maintain_rus.html",n,0,0,2,0,0);
it=s1.addItem(1,2,2,"Земельные<br />правоотношения",n,n,"","practice_land_rus.html",n,n,n,"practice_land_rus.html",n,0,0,2,0,0);
it=s1.addItem(1,2,2,"Недвижимость и <br /> строительство",n,n,"","practice_estate_rus.html",n,n,n,"practice_estate_rus.html",n,0,0,2,0,0);
it=s1.addItem(1,4,4,"Недропользование",n,n,"","practice_subsoil_rus.html",n,n,n,"practice_subsoil_rus.html",n,0,0,2,0,0);
it=s1.addItem(1,2,2,"Налогообложение",n,n,"","practice_nalog_rus.html",n,n,n,"practice_nalog_rus.html",n,0,0,2,0,0);
it=s1.addItem(1,2,2,"Таможенное право и<br/>валютное регулирование",n,n,"","practice_castoms_rus.html",n,n,n,"practice_castoms_rus.html",n,0,0,2,0,0);
it=s1.addItem(1,2,2,"Корпоративная<br />практика",n,n,"","practice_corporate_rus.html",n,n,n,"practice_corporate_rus.html",n,0,0,2,0,0);
it=s1.addItem(1,2,2,"Бинкротство",n,n,"","practice_bankrupt_rus.html",n,n,n,"practice_bankrupt_rus.html",n,0,0,2,0,0);
it=s1.addItem(1,2,2,"Коммерческая практика",n,n,"","practice_commercial_rus.html",n,n,n,"practice_commercial_rus.html",n,0,0,2,0,0);
it=s1.addItem(1,2,2,"Досудебное урегулирование <br /> споров Судебные и <br /> арбитражные процессы",n,n,"","practice_regulator_rus.html",n,n,n,"practice_regulator_rus.html",n,0,0,2,0,0);
it=s0.addItem(1,3,3,"Наши юристы",n,n,"","personal_rus.html",n,n,n,"personal_rus.html",n,0,0,2,0,0);
it=s0.addItem(1,2,2,"Наши клиенты",n,n,"","clients_rus.html",n,n,n,"clients_rus.html",n,0,0,2,0,0);
it=s0.addItem(1,2,2,"Контакты",n,n,"","contacts_rus.html",n,n,n,"contacts_rus.html",n,0,0,2,0,0);
s0.pm.buildMenu();
}}
