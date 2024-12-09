# ①じゃんけんの処理
def janken
  puts "じゃんけん・・・"
  puts "0(グー) 1(チョキ) 2(パー) 3(戦わない)"
  select_number = gets.to_i
  select_number = 3 if !(0..3).include?(select_number)
  random_number = rand(3)

  jankens = ["グー", "チョキ", "パー", "戦わない"]
  puts "あなた：#{jankens[select_number]} 相手：#{jankens[random_number]}"
  
# ②戦わない場合
  if select_number == 3 || random_number == 3
    puts "じゃんけんが放棄されました。ゲームを終了します。"
  exit
  end

# ③じゃんけんの結果を判定
  number = select_number - random_number
  case number
  when 0
    puts "結果はあいこです"
    :draw #シンボル
  when -1, 2  
    puts "結果は勝ちです あっちむいて..." 
    :win
  when 1,-2
    puts "結果は負けです あっちむいて..."  
    :lose
  end
end  

# ④じゃんけん(janken)の呼び出し
result = nil #グローバル変数(＝スコープ広⇨ローカル変数からデータ共有)
loop do
 result = janken #ローカル変数
 break unless result == :draw #結果がdrawでなければループを終了する = drawであれば、janken処理をループ
end

# ⑤あっちむいてホイの処理
def acchimuite_hoi
  puts "0(上) 1(下) 2(左) 3(右)"
  select_number2 = gets.to_i
  select_number2 = 3 if !(0..3).include?(select_number2)
  random_number2 = rand(3)

  directions = ["上","下","左","右"]
  puts "あなた：#{directions[select_number2]} 相手：#{directions[random_number2]}"
  puts "------------------------------"

  # あなたと相手の選択が一致した場合、acchimuite_hoiメソッドのtrueと指定
  select_number2 == random_number2
end

# ⑥あっちむいてホイの結果を判定(acchimuite_hoiの呼び出し)
case result #result = nilからデータを共有
when :win
  loop do
    if acchimuite_hoi
      puts "あなたの勝ちです"
      break  
    else   
      janken  # じゃんけんに戻る
    end
  end

when :lose
  loop do
    if acchimuite_hoi
      puts "相手の勝ちです"
      break  
    else   
      janken
    end
  end
else
  puts "ゲームを終了しました。"
end
  
# 【解説】
# ①じゃんけんの処理
# 1-7:あなたと相手のインデックスを定義
# 9-10:文字列補完で、jankensの配列に対し、指定されたインデックスを取得

# ④じゃんけんの呼び出し
# 34 result = nillでresultを初期化し、グローバル変数として定義
# 36 result = janken(ローカル変数)をグローバル変数にわたす(34)

# ⑤あっちむいてホイの処理
# じゃんけんの処理(①)と同様

# ⑥あっちむいてホイの結果を判定(acchimuite_hoiの呼び出し)
# 56 case result when :win をif文で表すと⇨ if resulut == :win
#   34のグローバル変数のresultの結果を渡している




