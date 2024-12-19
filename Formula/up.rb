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
  version 'v0.36.2'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.36.2/bundle/up/darwin_amd64.tar.gz'
    sha256 '8a66a6afa19fe261143feb7b5e630acd586a241afe71453d01f4db6cd8fd19bc'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.36.2/bundle/up/darwin_arm64.tar.gz'
    sha256 'd2cc0e80babf1ca80a65b82641aa4a270b897746da0e215c620345e9b24caacc'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.36.2/bundle/up/linux_amd64.tar.gz'
    sha256 '76d029ce78b48af86dcdb1d26c63d2df4a467f056133f985cda370b6a01e0efa'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.36.2/bundle/up/linux_arm.tar.gz'
    sha256 '1a33651f3cdd6c743054bc528cf6c78a538f0bdb9a01d3a96587d1d9880c5032'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.36.2/bundle/up/linux_arm64.tar.gz'
    sha256 'bab904f21186576b056bb2a69ae77293c5130032b403b27c1b13f59c29f8c4f4'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
