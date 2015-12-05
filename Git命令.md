# Git
**Git是分布式管理工具，是基于快照的**
## git 基本命令
***
####git config --global user.name username
####git config --global user.email Emileaddress
配置Git
#### git init 
创建git
#### git status 
查看状态
#### git add 
跟踪并添加到暂存区
#### git commit 
提交
#### git log 
查看日志
#### git diff 
对比
#### git mv 
改名
#### git rm 
删除
#### git commit --amend 
修改日志or整合提交
***
### 撤销命令（工作区）
#### git checkout -- (文件) 
工作区的撤销（慎用！！！）
#### git stash 
回退（修改放入垃圾桶）
#### git stash apply (加序号) 
恢复（从垃圾桶回撤修改）
#### git stash list 
列出回退表
#### git stash clear 
清空垃圾桶
### 撤销（暂存区）
#### git reset HEAD(HEAD是最近的提交)	 
暂存区恢复至工作区
### 撤销（已提交）
#### 利用hash回退
#### git reset --hard (hash)
#### git reflog 
列出提交日志列表
#### git revert (hash) 
撤销某一次提交的操作  
###Git使用的是sha-1算法的hash
***
### 标记
#### git tag (标记名) -m "(描述)"
打标记
#### git tag -a (标记名) -m "(描述)" (哈希值)
为某一提交标记
#### git show (标记名) 
显示标记信息
***
## Git的分支
refs/heads/  
该文件夹下是分支记录文件
### 分支 branch
#### git branch
查看分支
#### git branch (分支名)
创建新分支
#### git branch -d (分支名)
删除一个分支
#### git checkout (分支名)
切换一个分支
#### git checkout -b (分支名)
切换并创建分支
#### git branch --merged
查看分支的合并情况
#### git branch --no-merged
查看未合并的分支情况
### Git的合并和重衍
### 分支合并
#### git merge (分支名)
合并分支
### 重衍（快合并）（不推荐使用）
#### git rebase (分支名A) (分支名B)
重衍（基于A，重做B）  
做成串行式提交流
#### git rebase --continue
解决冲突或问题后，继续重衍
### 交互式重衍（高级用法…）
#### git rebase -i (hash)
人为指定重衍过程
***
## Git远端操作
#### git clone URL -
从远端仓库拷贝/拷贝远端仓库
#### git remote - 
远端仓库：列出、添加、删除
#### git remote add XXX
添加远端仓库XXX
#### git init --bare
建立裸仓库（XXX.git git init --bare）
#### git push origin(服务器名) master(分支A):teacher(分支B)
推送至仓库的…(分支)
#### git fetch origin master
从远端的…（服务器）（master）分支更新  
然后再使用git merge合并  
git merge origin/master
#### git pull origin master
此命令约等于  
git fetch + git merge
#### git checkout --track origin/master
本地建立同名远端分支(已不推荐使用)
#### git checkout -b sf origin/(分支名)
本地建立重命名的远端分支（已不推荐使用）
### 现在可以直接切换已更新的分支
***
##GitHub
####pull requeste
推送请求
***
# Git的分支模型
<a href="http://pic.ffsky.net/image/B2I"><img src="http://pic.ffsky.net/images/2015/11/13/38ed77e76e4a1d1037b4163dc7667571.md.png" alt="38ed77e76e4a1d1037b4163dc7667571.md.png" border="0"></a>
***
# Git的工作流
## 小团队
中心化的工作流
## 集成经理的工作流
只有一个集成经理来向服务器推送，拉取各个开发者私有仓库的代码，然后推送。  
其他开发者拥有私有仓库，且只对私有仓库推送。
## 司令员副将工作流
多层级的集成经理工作流
***
#Git参考书：Pro Git
**想要做好编程，还是要学好英语啊……T^T**