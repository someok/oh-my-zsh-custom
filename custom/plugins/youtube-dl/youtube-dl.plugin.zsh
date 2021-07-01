# youtube-dl
# 下载最优音频视频，并合并成 mp4，不过后者对于 bilibili 之类的不适应
alias yd='youtube-dl -f bestvideo+bestaudio --merge-output-format mp4'
# 下载播放列表
alias ydlist="youtube-dl -f bestvideo+bestaudio -o '%(playlist)s/%(playlist_index)s - %(title)s-%(id)s.%(ext)s'"
# 返回文件名
alias ydname='youtube-dl --get-filename'

alias ydnpl="youtube-dl --no-playlist"

# List formats & prompt for which one(s) to download
ydf() {
    FORMATS=$(ydnpl --list-formats "$1")
    echo "$FORMATS" | grep --extended-regexp --invert-match " only"
    echo ""
    echo "$FORMATS" | grep --extended-regexp "video only"
    echo ""
    echo "$FORMATS" | grep --extended-regexp "audio only"
    echo "" && echo "== Preparing to save download as:"
    echo "  $(pwd)/$(youtube-dl --get-filename $1)"
    echo "== Please copy-paste 👇 a 'format code' (or vid+aud) ☝️"
    read -r FORMAT
    ydnpl --format "$FORMAT" "$1"
}
