module SignHelper
  def checkbox_row(name, text, score, el= :q)
    content_tag el, :style => "text-align:start" do
      label_tag(name, text, class:"mr-2")+
      check_box_tag(name, "", score, class: "mt-px")
    end
  end

  def score_for_checked(score, name1="pass", name2="fail", test1="合格", test2="不合格", el= :p)
    content_tag :div do
      if score == nil
        checkbox_row(name1, test1, nil, el)+
        checkbox_row(name2, test2, nil, el)
      elsif score == 1
        checkbox_row(name1, test1, true, el)+
        checkbox_row(name2, test2, false, el)
      else
        checkbox_row(name1, test1, false, el)+
        checkbox_row(name2, test2, true, el)
      end
    end
  end

  def date_format(date, type="time")
    if date != nil
    d_to_a = date.to_s.split
    if type == "date"
      d_date = d_to_a[0].split("-")
      return "#{d_date[0]}年 #{d_date[1]}月 #{d_date[2]}日"
    elsif type == "time"
      d_time = d_to_a[1].to_s.split(":")
      return "#{d_time[0]} : #{d_time[1]}"
    end
    end
  end

end
