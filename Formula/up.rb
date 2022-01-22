# Copyright 2021 Upbound Inc
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

class Up < Formula
    desc "The official Upbound CLI"
    homepage "https://upbound.io"
    version "v0.7.0"
    license "Upbound Software License"
  
    if OS.mac? && Hardware::CPU.intel?
      url "https://cli.upbound.io/stable/v0.7.0/bundle/darwin_amd64.tar.gz"
      sha256 "f5fe1b4cd8fd61e317a2789d0b636a769be003d98ce497e87789a6c979e7639c"
    end
    if OS.mac? && Hardware::CPU.arm?
      url "https://cli.upbound.io/stable/v0.7.0/bundle/darwin_arm64.tar.gz"
      sha256 "a325939a47e2905462f404482ea7fdbf035afd2f27526d535eac6c989198088d"
    end
    if OS.linux? && Hardware::CPU.intel?
      url "https://cli.upbound.io/stable/v0.7.0/bundle/linux_amd64.tar.gz"
      sha256 "dc74b95fbabb88b52638f91591ee36d951f2638608b46d2d9e6d1e52fbaa782a"
    end
    if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://cli.upbound.io/stable/v0.7.0/bundle/linux_arm.tar.gz"
      sha256 "51e97587442be91c407638fd2dc33be46596db7ffa4243947a76431d7089f5f9"
    end
    if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://cli.upbound.io/stable/v0.7.0/bundle/linux_arm64.tar.gz"
      sha256 "db1be854a684948dcec0947e29b2339061bc1ea98e5cbde260ae6563860b501c"
    end
  
    def install
      bin.install "up"
    end
  
    test do
      system "#{bin}/up -v"
    end
  end
