class Rbx < Formula
  desc "Rubinius Language Platform compiler and runtime"
  homepage "https://github.com/rubinius/rbx"
  url "https://github.com/rubinius/rbx/archive/refs/tags/v26.0.tar.gz"
  sha256 "ebdef671b4a636887034aaf4fa9f3ea20f70b80a2675d58b2dfb5feea1e4c6a4"
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
