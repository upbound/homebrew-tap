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
  version 'v0.53.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.53.0/bundle/darwin_amd64/up.tar.gz'
    sha256 '89f7b042c682348717b198b0c5a21a3381ef72c7ea8e14d738668d58458806e4'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.53.0/bundle/darwin_arm64/up.tar.gz'
    sha256 'd7f5a89c03fb4cfb4a75e6388f8213d512b0265599d8dae9121af446ad302bfc'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.53.0/bundle/linux_amd64/up.tar.gz'
    sha256 'bedcea9c1512623634f172c0149aa1b07569da5ba9a8e1da0b29fa22f7d4f05d'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.53.0/bundle/linux_arm64/up.tar.gz'
    sha256 'a3703011ea7999498712100d7696fef73ccae31eeae284bec4feaa47823dffe6'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
