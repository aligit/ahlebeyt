/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/
CKEDITOR.editorConfig=function(config){config.filebrowserBrowseUrl="/ckeditor/attachment_files",config.filebrowserFlashBrowseUrl="/ckeditor/attachment_files",config.filebrowserFlashUploadUrl="/ckeditor/attachment_files",config.filebrowserImageBrowseLinkUrl="/ckeditor/pictures",config.filebrowserImageBrowseUrl="/ckeditor/pictures",config.filebrowserImageUploadUrl="/ckeditor/pictures",config.filebrowserUploadUrl="/ckeditor/attachment_files",config.filebrowserParams=function(){for(var csrf_token,csrf_param,meta,metas=document.getElementsByTagName("meta"),params=new Object,i=0;i<metas.length;i++)switch(meta=metas[i],meta.name){case"csrf-token":csrf_token=meta.content;break;case"csrf-param":csrf_param=meta.content;break;default:continue}return void 0!==csrf_param&&void 0!==csrf_token&&(params[csrf_param]=csrf_token),params},config.addQueryString=function(url,params){var queryString=[];if(!params)return url;for(var i in params)queryString.push(i+"="+encodeURIComponent(params[i]));return url+(-1!=url.indexOf("?")?"&":"?")+queryString.join("&")},CKEDITOR.on("dialogDefinition",function(ev){var content,upload,dialogName=ev.data.name,dialogDefinition=ev.data.definition;CKEDITOR.tools.indexOf(["link","image","attachment","flash"],dialogName)>-1&&(content=dialogDefinition.getContents("Upload")||dialogDefinition.getContents("upload"),upload=null==content?null:content.get("upload"),upload&&upload.filebrowser&&void 0===upload.filebrowser.params&&(upload.filebrowser.params=config.filebrowserParams(),upload.action=config.addQueryString(upload.action,upload.filebrowser.params)))})};