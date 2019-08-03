  # 这个脚本用于使用git push项目文件  
  git init  
  ssh-keygen -t rsa -C "ch37915405887@gmail.com"  
  # 将id_rsa.pub的内容添加到Setting的SSH key中  

  ssh -T git@github.com  
  git config --global user.name "ChongHui-007"  
  git config --global user.email "ch37925405887@gmail.com"  
  
  # 网页端建立项目  
  git remote add origin git@github.com:ChongHui-007/Git仓库名称.git  

  git config branch.master.remote origin    
  git config branch.master.merge refs/heads/master   
  git pull  
  git status  
  git commit # 为想添加的文件取消注释  
  git push origin master # done！  
