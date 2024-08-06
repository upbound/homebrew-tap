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
  version 'v0.32.1'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.32.1/bundle/up/darwin_amd64.tar.gz'
    sha256 'aed17d6ad64f04ad4275af440b04bb866b3a2c2ab92d46e76779c661e9dd6fd1'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.32.1/bundle/up/darwin_arm64.tar.gz'
    sha256 '1e7ee667f86b0aaf7b6fcdecbc2f616b69d0e26d28233fe8e42bebdc11b193b7'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.32.1/bundle/up/linux_amd64.tar.gz'
    sha256 '82a1b6772ced9c6f5ef85db69b21b6d0714fffc9ef4f2448de35ec03f7468bf7'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.32.1/bundle/up/linux_arm.tar.gz'
    sha256 '38d9c6ca0f9522eee57d83f8fda71a7dc631ea4428b1c62b3109d303eb4e3a9c'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.32.1/bundle/up/linux_arm64.tar.gz'
    sha256 'dca0930be945dc70f527457f947a9318b1118789259c7463a3db0972e1d22ba8'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
