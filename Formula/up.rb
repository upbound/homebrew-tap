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
  version 'v0.55.2'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.55.2/bundle/darwin_amd64/up.tar.gz'
    sha256 '26e76272ba702c6205fd278589315f4a2edd6d615fa72b6ae7fea7e925602569'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.55.2/bundle/darwin_arm64/up.tar.gz'
    sha256 '6196afc1e00b37e4dc7756b66d7a41bd76f5ee494b5ad8e484700280c5b99581'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.55.2/bundle/linux_amd64/up.tar.gz'
    sha256 'fc6ab62d3f28e6921f6605ce5dad65eddff488165f7829b7ff6ba137f1f9e8ec'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.55.2/bundle/linux_arm64/up.tar.gz'
    sha256 '178d798b2b57c9e1fd3fbd3689be3f00eb77a9106945c171ba9a4d69007d6b98'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
