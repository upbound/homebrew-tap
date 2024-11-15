# frozen_string_literal: true

# Copyright 2022 Upbound Inc
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
  desc 'The official Upbound CLI'
  homepage 'https://upbound.io'
  version 'v0.35.3'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.35.3/bundle/up/darwin_amd64.tar.gz'
    sha256 'df8986038d345511170abe8805cf6c6bf308e3a495d31a994b2af5cfb1dc30c6'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.35.3/bundle/up/darwin_arm64.tar.gz'
    sha256 '8efbe185935ef0601378caf8e2056aa816dc41b49025d59de31d53cd4489091d'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.35.3/bundle/up/linux_amd64.tar.gz'
    sha256 '4d9ca5c65817642af5bf97509dd46bc59de8d18d5608b68a8be3ac34b519b53f'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.35.3/bundle/up/linux_arm.tar.gz'
    sha256 '1a33651f3cdd6c743054bc528cf6c78a538f0bdb9a01d3a96587d1d9880c5032'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.35.3/bundle/up/linux_arm64.tar.gz'
    sha256 '690fb4fe33cc38d010c671f076f02b3002f0fad51c104bf101d104a42cb055a3'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
