cd $(dirname $0)

bg_color="#c99A59"          #color14
fg_color="#5c3809"          #color10
base_color="#F5D3A6"        #color15
text_color="#422402"        #color0
selected_bg_color="#826114" #color2
selected_fg_color="#F5D3A6" #color15
tooltip_bg_color="#281200"  #color8
tooltip_fg_color="#a07230"  #color11
titlebar_bg_color="#281200" #color8
titlebar_fg_color="#a07230" #color11
menubar_bg_color="#281200"  #color8
menubar_fg_color="#a07230"  #color11
toolbar_bg_color="#c99A59"  #color14
toolbar_fg_color="#5c3809"  #color10
menu_bg_color="#281200"     #color8
menu_fg_color="#a07230"     #color11
panel_bg_color="#281200"    #color8
panel_fg_color="#a07230"    #color11
link_color="#F5D3A6"        #color15

color_scheme="bg_color:$bg_color\\\\nfg_color:$fg_color\\\\nbase_color:$base_color\\\\ntext_color:$text_color\\\\nselected_bg_color:$selected_bg_color\\\\nselected_fg_color:$selected_fg_color\\\\ntooltip_bg_color:$tooltip_bg_color\\\\ntooltip_fg_color:$tooltip_fg_color\\\\ntitlebar_bg_color:$titlebar_bg_color\\\\ntitlebar_fg_color:$titlebar_fg_color\\\\nmenubar_bg_color:$menubar_bg_color\\\\nmenubar_fg_color:$menubar_fg_color\\\\ntoolbar_bg_color:$toolbar_bg_color\\\\ntoolbar_fg_color:$toolbar_fg_color\\\\nmenu_bg_color:$menu_bg_color\\\\nmenu_fg_color:$menu_fg_color\\\\npanel_bg_color:$panel_bg_color\\\\npanel_fg_color:$panel_fg_color\\\\nlink_color:$link_color"

sed -i "s/gtk-color-scheme = .*/gtk-color-scheme = \"$color_scheme\"/" ./gtkrc
