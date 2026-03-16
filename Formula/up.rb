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
  version 'v0.45.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.45.0/bundle/darwin_amd64/up.tar.gz'
    sha256 '4dd32ec64872b58eb8c2dbc1c5986179f72331b98fee4a27ceed5f8ab3831965'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.45.0/bundle/darwin_arm64/up.tar.gz'
    sha256 '8373fba6c4d747831bfb722b98d8f5740362a5f91cf56456cd69e6e4d058f03b'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.45.0/bundle/linux_amd64/up.tar.gz'
    sha256 'bb36fd1e34632c9f6fa2768cac9554307522a5f0c834e63362bdbf8e0eefcbeb'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.45.0/bundle/linux_arm64/up.tar.gz'
    sha256 '94feb19573fba7b09dcba474c5904c71729d759c6387d05efd785ee64ed3f05d'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
