;;; init-dashboard.el --- configure dashboard

;;; Commentary:

;; Copyright (C) 2019  杨霖

;;; Code:

(use-package dashboard
  :ensure t
  :custom
  (dashboard-items '((recents . 5)
		     (bookmarks . 5)
		     (projects . 5)
		     (agenda . 5)
		     ))
  ;; :hook
  ;; (after-init . d)
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-banner-logo-title "Happy Hacking!")
  (setq dashboard-set-heading-icons nil)
  (setq dashboard-set-file-icons t)
  (dashboard-modify-heading-icons '(
  				    (bookmarks . "book")))
  (setq dashboard-set-navigator t)
  (setq dashboard-footer-messages '("种下一棵树最好的时间是十年前,其次就是现在!"
				    "凡事有交代，件件有着落，事事有回音"
				    "人生的舞台上也是如此。有人做皇帝，有人做教皇；反正戏里的角色样样都有。他们活了一辈子，演完这出戏，死神剥掉各种角色的戏装，大家在坟墓里也都是一样的了"
				    "人往往越讨厌某种食物,就越不能冷静地看待它."
				    "枕头里藏满了发霉的梦,梦里住满了无法拥有的人"
				    "世界上只有两样东西是值得我们深深景仰的，一个是我们头上的灿烂星空，另一个是我们内心的崇高道德法则"
				    "我们坚持做一件事情，并不是因为这样做会有效果，而是坚信，这样做是对的"
				    "人都喜欢买东西，而不是被买东西"
				    "凡事要弄清目的和手段"
				    "世上真正能成就一番事业，谋得不是功名的人毕竟是极少数，大部分百姓都是贩夫走卒，忙忙碌碌终其一生"
				    "什么样的人生最失败？把大部分时间都浪费在对过去自怨自艾和对未来的惶惶不安中"
				    "对思想最大的桎梏不是监狱的高墙，而是宗教般的洗脑"
				    "有暴君的地方一定有肯当奴隶的人，那么要想让民众参与政治，就需要启蒙人们的心智"
				    "人可以暂时穿着皇帝的新装麻醉自己，但是对自己不切实际的定位只能害了自己"
				    "一个人只有付出（哪怕是一点点），才会珍惜他所换来的"
				    "故善者因子，其次利道之，其次教诲之，其次整齐之，最下者与之争"
				    "一个维护少数人富裕的国家，虽然可以强大一时，但是很难持久"
				    "我必须学习政治和战争，这样我的孩子才有可能学习数学和哲学，以及地理、自然历史等等，然后我的孙子才有机会学习绘画、诗歌、音乐、建筑、编织女红和瓷艺"
				    "人之所以为人，是因为我们善于借助外力，而不是先天有多少优势"
				    "尼采讲，除了神灵、野兽和哲学家，人都忍受不了孤独，摆脱孤独，就会有依赖朋友的需求"
				    "钱是为了让你做想做的事，而不是不做事"
				    "要解决问题的第一步，是要先承认问题的存在"
				    "风光的背后，不是沧桑就是肮脏"
				    "阅读不仅让我们在冷酷无情的科技时代获得喘息，而且重启了大脑深入思考的功能，还是抵抗狭隘、思想控制和舆论支配的方式"
				    "夏虫不可以语于冰者，笃于时也；曲士不可以语于道者，束于教也"
				    "吾生也有涯，而知也无涯，以有涯随无涯，殆矣。已而为知者，殆而已矣"
				    "既然有白天就有黑夜，那么我们不能够因为喜欢白天就厌恶黑夜。因此，我们不应该由于自己对一件事情的喜爱，就不宽容别人做相反的事情"
				    "信命是知道自己有所不能，认命则是不超越命运给自己画的线。出身好不过是人生交了一次好运而已，并不代表一辈子的命都能好；反之亦然，生于贫穷之家的人，未必没有好命"
				    "成人的孤独不是无人陪伴，而是在习惯孤独之后，拒绝陪伴"
				    "不能用一种极端的方式反对极端"
				    "世界是你们的，也是我们的，但是归根结底是你们的。你们青年人朝气蓬勃，正在兴旺时期，好像早晨八九点钟的太阳。希望寄托在你们身上"
				    "这个世界总是不缺乏梦想家，他们当中，那些成功实现了梦想的人是幸福的，另一些至少也依靠追逐梦想维持了生计。"
				    "人要成为伟大，而不是显得伟大。要成为一流，而不是显得像一流"
				    "我们绝大部分人的成长过程就是不断受到挫折的过程，而在挫折之后又无法彻底解决问题，于是越来越认命，放弃掉越来越多想要的东西。对于成年人，如果多少还怀念一点孙悟空，可能就会更有出息。人成长的过程，其实就是逐渐杀死心目中的孙悟空的过程"
				    "富贵多士，贫贱寡友，事之固然也"
				    "要耐心对待你心中的未解之事，试着去喜欢问题"
				    "人其实都有两面——想成为亚历山大的一面，和想成为第欧根尼的一面。而生活不过是这两方面的平衡而已，只不过通常我们更在乎亚历山大的一面，而忽视了另一面罢了"
				    "千山我独行"
				    "我们的认知受限于我们的行为和周围的环境"
				    "最好是更好的敌人"
				    "很多时候，我们不能听别人怎么讲，要看他们怎么做"
				    "如果我们能够有很好的风险意识，就会采用完全不同的做事策略，这样我们的成功率就要大很多"
				    "一个好的产品，一定要解决一个特定的问题，这个问题最好不是现有产品已经解决的，既然是解决新问题，就不要陷入当前产品的固定思维，同时成本要可控，要在迭代中进步"
				    "打架（打仗）是一件容易的事情，三岁的小孩都会。讲道理，让别人信服，则是艺术"
				    "只与鸿儒争高下，不与白丁论长短。"
				    ))


  )
(provide 'init-dashboard)
;;; init-dashboard.el ends here
