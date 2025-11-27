class Rbx < Formula
  desc "Rubinius Language Platform compiler and runtime"
  homepage "https://github.com/rubinius/rbx"
  url "https://github.com/rubinius/rbx/archive/refs/tags/v26.0.tar.gz"
  sha256 "5bbc588ff47ba6aed128a7bb947547de0bbf2587595a26928390c0ebaba4ce8d"
  license "BSD-3-Clause"

  depends_on "build2" => :build
  depends_on "make" => [:build, :test]

  def install
    system "make", "setup"
    system "make", "config"
    system "make", "build"

    # Not in Makefile because installation specific
    system "b", "install", "config.install.root=#{prefix}"
  end

  test do
    system "make", "test"
  end
end
