# gemspecは生成された雛形の中で最も重要なファイル。
# gemパッケージの作者に関する情報や、gemパッケージを構成するために必要な情報が含まれている。
require_relative 'lib/gem_sample_pruby/version'

# 以下のブロックにgemの情報が記述されている。
Gem::Specification.new do |spec|
  spec.name          = "gem_sample_pruby" # この値がrubygems.orgで公開される時の名称として使われる。
  spec.version       = GemSamplePruby::VERSION # lib/gemパッケージ名/version.rbから取得している。
  spec.authors       = ["Kawarabata"]
  spec.email         = ["kwrbt0404@gmail.com"]

  spec.summary       = %q{practice in perfect ruby}
  spec.description   = %q{This is sample gem in perfect ruby.}
  spec.homepage      = "https://rubygems.org"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe" # 実行可能コマンドのディレクトリを示す
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) } # gemパッケージに含まれる実行可能コマンドとしてのファイルのリストを表す
  spec.require_paths = ["lib"] # RubyGemsがライブラリのロードパスを構築する際に利用する。require_paths以下にあるファイルは、そこをルートとしたパスでrequire対象として記述できる。

  # 作成するgemパッケージがあるgemパッケージに依存している場合は、Gem::Specification#add_runtime_dependencyメソッド。第二引数にバージョンも指定できる。
  spec.add_runtime_dependency 'nokogiri'
  spec.add_runtime_dependency 'json', '>= 1.7.3'

  # 開発時に利用するgemパッケージへの依存関係は、Gem::Specification#add_development_dependencyメソッドを使って指定。
  spec.add_development_dependency 'minitest'
end
