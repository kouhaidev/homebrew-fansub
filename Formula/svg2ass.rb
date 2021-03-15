class Svg2ass < Formula
  desc "Convert SVG vector graphics to ASS subtitle draw instructions"
  homepage "https://github.com/irrwahn/svg2ass"
  url "https://github.com/irrwahn/svg2ass/archive/53be678a5be24d690b421bce5f1e345ae960077c.tar.gz"
  version "0.0.20210221"
  sha256 "78ba8796bb56d7c31d4b80623650c36a0c64fff64c5f9bfc67147f14b94a3b7e"
  license "BSD-3-Clause"

  depends_on "make" => :build
  depends_on "gnu-getopt"

  def install
    cp "version.in", "version.h"
    inreplace "version.h", "Unknown", "${version}"
    system "make", "release", "STRIP=strip -S", "VERGEN=:"
    bin.install "svg2ass"

    # Default completions timeout
    File.write("svg2ass.fish", "complete -c svg2ass -e")
    fish_completion.install "svg2ass.fish"
  end

  test do
    example = <<~EOF
      <svg baseProfile="full" width="300" height="200" xmlns="http://www.w3.org/2000/svg">
        <rect width="100%" height="100%" fill="red"/>
        <circle cx="150" cy="100" r="80" fill="green"/>
        <text x="150" y="125" font-size="60" text-anchor="middle" fill="#fff">
            SVG
        </text>
      </svg>
    EOF
    (testpath/"test.svg").write(example)
    expected = "Dialogue:"
    assert_match expected, shell_output("#{bin}/svg2ass #{testpath/"test.svg"}")
  end
end
