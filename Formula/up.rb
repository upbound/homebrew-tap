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
  version 'v0.27.0'
  license 'Upbound Software License'

  if OS.mac? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.27.0/bundle/up/darwin_amd64.tar.gz'
    sha256 '72027b00be6f002d1bf33d29ef08c72ec2b66c48e38c0d1fbb4aa10d0d53c689'
  end
  if OS.mac? && Hardware::CPU.arm?
    url 'https://cli.upbound.io/stable/v0.27.0/bundle/up/darwin_arm64.tar.gz'
    sha256 'bca8fb44258e6aa3841c141a9ff979c3ae2537c98f826aa2c8af5ae39f9afd99'
  end
  if OS.linux? && Hardware::CPU.intel?
    url 'https://cli.upbound.io/stable/v0.27.0/bundle/up/linux_amd64.tar.gz'
    sha256 'c56defcb87d357a61319f635685d6a5a485bfd544fc9d39f121d9745681eed64'
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.27.0/bundle/up/linux_arm.tar.gz'
    sha256 '3a91af396e74d1d1cce0a3b48f581ee20a7b1e9ee461a333cae1ace60f6356af'
  end
  if OS.linux? && Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
    url 'https://cli.upbound.io/stable/v0.27.0/bundle/up/linux_arm64.tar.gz'
    sha256 '4d60df5cbfdf03be57fb58357050abd25a4e7b771ae0da4b35c0c865b89152bd'
  end

  def install
    bin.install 'up'
  end

  test do
    system "#{bin}/up -v"
  end
end
