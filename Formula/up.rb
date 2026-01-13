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
  version 'v0.44.2'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.44.2/bundle/darwin_amd64/up.tar.gz'
    sha256 '38d9de9b493b99a6d673340d665e1981610be0f38f7ecbaf57bcfdac743716bf'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.44.2/bundle/darwin_arm64/up.tar.gz'
    sha256 'e1ecf2ca8f1622923f08ff716a06723ce64f8af9ae46df1cbca0d0e64548bc30'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.44.2/bundle/linux_amd64/up.tar.gz'
    sha256 '9dca2644f0aa18c3a195f73f436b40903f62632c92fafd001f2a42bd6ef74c8f'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.44.2/bundle/linux_arm64/up.tar.gz'
    sha256 '40dad716b95b33b9fe6f620fec94f21380619e56198b1e220e63bb4a495be1df'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
