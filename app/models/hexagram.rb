# encoding: utf-8

class Hexagram
  @hexagram_of_the_day = 'Nicebar ䷀'
  @hexagram_of_the_day = 'Nicebar &#x4DC0;'
  
  def self.for_the_day(datetime) 
    this_year = LunarYear.where("start_date <= ?", datetime).order('start_date desc').first
    date = DateTime.parse(this_year.start_date.to_s)
    days = datetime - date
    hexagram = DAILY_SEQUENCE[(this_year.hexagram_cycle_starting_point + days)%72]
    hexagram
  end
  
  def self.[](i)
    HEXAGRAMS[i]
  end
  
  DAILY_SEQUENCE = [
    1, 43, 14, 34, 0, 9, 5, 26, 11,
    10, 58, 38, 54, 0, 61, 60, 41, 19,
    13, 49, 30, 55, 0, 37, 63, 22, 36,
    25, 17, 21, 51, 0, 42, 3, 27, 24,
    44, 28, 50, 32, 0, 57, 48, 18, 46,
    6, 47, 64, 40, 0, 59, 29, 4, 7,
    33, 31, 56, 62, 0, 53, 39, 52, 15,
    12, 45, 35, 16, 0, 20, 8, 23, 2
    ]
  
  HEXAGRAMS = [
    {},
    {hexagram: '䷀',character: '乾',pinyin: 'qián',title: 'Heaven',unicode: '&#x4DC0'},
    {hexagram: '䷁',character: '坤',pinyin: 'kūn',title: 'Earth',unicode: '&#x4DC1'},
    {hexagram: '䷂',character: '屯',pinyin: 'zhūn',title: 'Sprouting',unicode: '&#x4DC2'},
    {hexagram: '䷃',character: '蒙',pinyin: 'méng',title: 'Immaturity',unicode: '&#x4DC3'},
    {hexagram: '䷄',character: '需',pinyin: 'xū',title: 'Waiting',unicode: '&#x4DC4'},
    {hexagram: '䷅',character: '訟',pinyin: 'sòng',title: 'Disputing',unicode: '&#x4DC5'},
    {hexagram: '䷆',character: '師',pinyin: 'shī',title: 'Army',unicode: '&#x4DC6'},
    {hexagram: '䷇',character: '比',pinyin: 'bǐ',title: 'Alliance',unicode: '&#x4DC7'},
    {hexagram: '䷈',character: '小畜',pinyin: 'xiǎo chù',title: 'Minor Force',unicode: '&#x4DC8'},
    {hexagram: '䷉',character: '履',pinyin: 'lǚ',title: 'Treading',unicode: '&#x4DC9'},
    {hexagram: '䷊',character: '泰',pinyin: 'tài',title: 'Great',unicode: '&#x4DCA'},
    {hexagram: '䷋',character: '否',pinyin: 'pǐ',title: 'Obstruction',unicode: '&#x4DCB'},
    {hexagram: '䷌',character: '同人',pinyin: 'tóng rén',title: 'Community',unicode: '&#x4DCC'},
    {hexagram: '䷍',character: '大有',pinyin: 'dà yǒu',title: 'Prosperity',unicode: '&#x4DCD'},
    {hexagram: '䷎',character: '謙',pinyin: 'qiān',title: 'Modesty',unicode: '&#x4DCE'},
    {hexagram: '䷏',character: '豫',pinyin: 'yù',title: 'Comfort',unicode: '&#x4DCF'},
    {hexagram: '䷐',character: '隨',pinyin: 'suí',title: 'Pursuit',unicode: '&#x4DD0'},
    {hexagram: '䷑',character: '蠱',pinyin: 'gǔ',title: 'Contamination',unicode: '&#x4DD1'},
    {hexagram: '䷒',character: '臨',pinyin: 'lín',title: 'Approach',unicode: '&#x4DD2'},
    {hexagram: '䷓',character: '觀',pinyin: 'guān',title: 'Observance',unicode: '&#x4DD3'},
    {hexagram: '䷔',character: '噬嗑',pinyin: 'shì kè',title: 'Biting',unicode: '&#x4DD4'},
    {hexagram: '䷕',character: '賁',pinyin: 'bì',title: 'Ornament',unicode: '&#x4DD5'},
    {hexagram: '䷖',character: '剝',pinyin: 'bō',title: 'Erosion',unicode: '&#x4DD6'},
    {hexagram: '䷗',character: '復',pinyin: 'fù',title: 'Return',unicode: '&#x4DD7'},
    {hexagram: '䷘',character: '無妄',pinyin: 'wú wàng',title: 'No Expectations',unicode: '&#x4DD8'},
    {hexagram: '䷙',character: '大畜',pinyin: 'dà chù',title: 'Great Store',unicode: '&#x4DD9'},
    {hexagram: '䷚',character: '頤',pinyin: 'yí',title: 'Jaws',unicode: '&#x4DDA'},
    {hexagram: '䷛',character: '大過',pinyin: 'dà guò',title: 'Excess',unicode: '&#x4DDB'},
    {hexagram: '䷜',character: '坎',pinyin: 'kǎn',title: 'Pit',unicode: '&#x4DDC'},
    {hexagram: '䷝',character: '離',pinyin: 'lí',title: 'Oriole',unicode: '&#x4DDD'},
    {hexagram: '䷞',character: '咸',pinyin: 'xián',title: 'To Be Moved',unicode: '&#x4DDE'},
    {hexagram: '䷟',character: '恆',pinyin: 'héng',title: 'Constancy',unicode: '&#x4DDF'},
    {hexagram: '䷠',character: '遯',pinyin: 'dùn',title: 'Pig',unicode: '&#x4DE0'},
    {hexagram: '䷡',character: '大壯',pinyin: 'dà zhuàng',title: 'Great Strength',unicode: '&#x4DE1'},
    {hexagram: '䷢',character: '晉',pinyin: 'jìn',title: 'Advance',unicode: '&#x4DE2'},
    {hexagram: '䷣',character: '明夷',pinyin: 'míng yí',title: 'Pheasant Call',unicode: '&#x4DE3'},
    {hexagram: '䷤',character: '家人',pinyin: 'jiā rén',title: 'Household',unicode: '&#x4DE4'},
    {hexagram: '䷥',character: '睽',pinyin: 'kuí',title: 'Incompatible',unicode: '&#x4DE5'},
    {hexagram: '䷦',character: '蹇',pinyin: 'jiǎn',title: 'Stumbling',unicode: '&#x4DE6'},
    {hexagram: '䷧',character: '解',pinyin: 'xiè',title: 'Release',unicode: '&#x4DE7'},
    {hexagram: '䷨',character: '損',pinyin: 'sǔn',title: 'Diminish',unicode: '&#x4DE8'},
    {hexagram: '䷩',character: '益',pinyin: 'yì',title: 'Increase',unicode: '&#x4DE9'},
    {hexagram: '䷪',character: '夬',pinyin: 'guài',title: 'Lurch',unicode: '&#x4DEA'},
    {hexagram: '䷫',character: '姤',pinyin: 'gòu',title: 'Meeting',unicode: '&#x4DEB'},
    {hexagram: '䷬',character: '萃',pinyin: 'cuì',title: 'Asembly',unicode: '&#x4DEC'},
    {hexagram: '䷭',character: '升',pinyin: 'shēng',title: 'Ascending',unicode: '&#x4DED'},
    {hexagram: '䷮',character: '困',pinyin: 'kùn',title: 'Beset',unicode: '&#x4DEE'},
    {hexagram: '䷯',character: '井',pinyin: 'jǐng',title: 'The Well',unicode: '&#x4DEF'},
    {hexagram: '䷰',character: '革',pinyin: 'gé',title: 'Molting',unicode: '&#x4DF0'},
    {hexagram: '䷱',character: '鼎',pinyin: 'dǐng',title: 'Tripod Vessel',unicode: '&#x4DF1'},
    {hexagram: '䷲',character: '震',pinyin: 'zhèn',title: 'Thunder',unicode: '&#x4DF2'},
    {hexagram: '䷳',character: '艮',pinyin: 'gèn',title: 'Still',unicode: '&#x4DF3'},
    {hexagram: '䷴',character: '漸',pinyin: 'jiàn',title: 'Gliding',unicode: '&#x4DF4'},
    {hexagram: '䷵',character: '歸妹',pinyin: 'guī mèi',title: 'A Girl is Married',unicode: '&#x4DF5'},
    {hexagram: '䷶',character: '豐',pinyin: 'fēng',title: 'Abundance',unicode: '&#x4DF6'},
    {hexagram: '䷷',character: '旅',pinyin: 'lǚ',title: 'Sojourner',unicode: '&#x4DF7'},
    {hexagram: '䷸',character: '巽',pinyin: 'xùn',title: 'Compliance',unicode: '&#x4DF8'},
    {hexagram: '䷹',character: '兌',pinyin: 'duì',title: 'Pleasuring',unicode: '&#x4DF9'},
    {hexagram: '䷺',character: '渙',pinyin: 'huàn',title: 'Overflowing',unicode: '&#x4DFA'},
    {hexagram: '䷻',character: '節',pinyin: 'jié',title: 'Juncture',unicode: '&#x4DFB'},
    {hexagram: '䷼',character: '中孚',pinyin: 'zhōng fú',title: 'Holding the Center',unicode: '&#x4DFC'},
    {hexagram: '䷽',character: '小過',pinyin: 'xiǎo guò',title: 'Small Succeeds',unicode: '&#x4DFD'},
    {hexagram: '䷾',character: '既濟',pinyin: 'jì jì',title: 'Already Across',unicode: '&#x4DFE'},
    {hexagram: '䷿',character: '未濟',pinyin: 'wèi jì',title: 'Not Yet Across',unicode: '&#x4DFF'}
  ]
  
end

