require 'spec_helper'

KEY = <<EOF
-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v1.4.12 (Darwin)

mQENBE3ett0BCAC7TJr02StlFEzMw5X+ou8BLI6T1ELPVv423+iheY9SB/47bugV
4r5JJA6zyzZfddGyPLJpi6Kj2hczxhaUwBSzk7xI70hAti5kdbOZVe98VK7jjZu3
pRIw8scqELfonelhCllD9aUI5Tx29G5AvbC9eZ7e0PUqTjqNvWfgPC7uP0tB5BVT
8CcHHbL/Nu+KShC78pBCOLsCND4wQhuaOoZIQfvpUp6iB52BOLkje9DZrwyUI41f
R3EsLDTwfB7VnzDRNQ/efBc5kuZM7ycJ6iJAhzlFn8t0/11sahzr3PK2gj5C7hJY
+VN/6YqafIF5BH/dN9/gTobmCcXP6Dc7rSJfABEBAAG0PEVyaWsgSG9sbGVuc2Jl
IChPcGVyYXRpb25zKSA8ZXJpay5ob2xsZW5zYmVAd2lsZGZpcmVhcHAuY29tPokB
OAQTAQIAIgUCTd623QIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQWkpD
GKaoAwTdEgf/R7U/UJ16rkCfvM7aL5TBgo+51SL0zovljXalgSRHoZquBHgkqJEv
hU0JFJB9CUeb4Yi2Ry8DAj7uR2IssMRdVP7/8Xhp7fcTc/jYMWg/ulwpCYW4I/QL
1BacPUB/wCjyol7LVPFodd8rWCWltlAGygP/HoTBTMHWv7JD0ZaAiWzWw/1oKn+B
OO+yHUsUrU7H7WBMm/moEEHyILXiPpXvuj3AQIPBu2FCimaOeUApF3tG15nzvcBT
3gNemeRQ6BAz/ohDQgpkMxFmL1s385IIJrpmMGi2cLsNjJA/p2Wi1fvk1usfvAjL
RX0Z7q561+xEJPN24RxJz98aakFh5Jiv27kBDQRN3rbdAQgAyBd+TRdhb6hJpl64
zJxj/1oVUIcfkcyqWjbACkeMZalIvCwnHMYk/F+BWRQYzuHS1SVKfQBCKHQGS24y
zOgXIZPpSIj9X9b+4qIrZf/O/+MmzqQ+W2hlSNt6aoUElt1ix3cw+rwQ1leKMrAC
poZf4QMUpc+7K9xbGy6aaLF6U7GXRwiQVwjvhmsmWhupcMQBjQmmHQdBnL1ooRVv
Gt6fBYvyCaVoGvB5oQjiyFJ3ISsraT6VrS+m/VMTEtMkhdqFu+Hb1Z7nZURwHaP8
mtGsl56GtanqbN7GFL5cdeq17zeRCRSccRxIfdFxacACdQZOgcd+vb8l/llzXKMk
2GoYvQARAQABiQEfBBgBAgAJBQJN3rbdAhsMAAoJEFpKQximqAMEP+cH/3JXAhxY
D4Fob+I2Ntae6mYZU27PZERS0ho8a5+3bz4XEkH1PFh/t3S1qgfTiM/n1rKnJpdn
N573YiBRYeSLAeNkNdI1H9OdKq/c/XLpujt06QAcDagzeSqyEGgJoyJ9tHaleguN
ND3o9+2tsiTzmyYzNPJMynwGZS5L7MhbVWBugQukGlSdHI/El/wmLFw5ta2i+nit
KEcLPqVMsOS/FvzWIgUFxqOHnsxVAxDSRFCoLa8+o7ceSi6Fh7yV2zApTXpGbrMr
pFIq+7bR57IzkX910CI7vWVQ0ighWV60pqDeP8bDGfwOyoxcNALd0mEajFgA/kXx
XCPJ/FcLYAP9xag=
=8FNs
-----END PGP PUBLIC KEY BLOCK-----
EOF

describe "GET /ascii", :type => :request do

  before do
    visit '/ascii'
  end

  it "has a textarea named 'qrcode'" do
    within "form" do
      page.should have_xpath("//textarea[@name='qrcode']")
    end
  end

  it "has a submit button" do
    within "form #submit" do
      page.should have_xpath("//input[@type='submit']")
    end
  end

  it "does not have a table" do
    page.should_not have_xpath("//table")
  end

end

describe "POST /ascii", :type => :request do

  before do
    visit "/ascii"
    fill_in('qrcode', :with => KEY)
    click_button('Show QR Code')
  end

  it "should have a table" do
    page.should have_xpath("//table")
  end
  
  it "should have a qr code" do
    @qr = RQRCode::QRCode.new(KEY, :size => 40, :level => :m) 
    page.all('td.black').count.should == @qr.to_s.count("x")
  end

end
