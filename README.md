# qiita-build

Qiita item builder from a template and stdin

## Installation

```
$ gem install qiita-build
```

## Usage

Given a below template,

```
# 自己紹介
* 氏名: %{fullname}
* ニックネーム: %{nickname}
* 居住地: %{location}
* 生年月日: %{birthday}
```

`qiita-build` will build an item from the template and stdin, like this.

```
$ echo '{"fullname": "Naoto Kanekoo", "nickname": "naoty", "location": "Tokyo", "birthday": "1987/6/2"}' | qiita-build -a <ACCESS TOKEN> -t <TEAM> <TEMPLATE ID>
# 自己紹介
* 氏名: Naoto Kaneko
* ニックネーム: naoty
* 居住地: Tokyo
* 生年月日: 1987/6/2
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/qiita-build/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
