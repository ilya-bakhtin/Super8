import("..\1983-Moskva-Tallinn.avs")
v14 = LSMASHVideoSource(dst_dir + "v14rc.mp4")

v14 = v14.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v14 = v14.convertToYV12(interlaced=false)

v14 = v14.deScratch
v14 = v14.removeDirt

v14 = v14.UnsharpMask(strength=500, radius=5, threshold=1)
v14 = v14.adjustBorders

va = BlankClip(v14, audio_rate = 48000, channels = 2).killVideo
v14 = v14.audioDub(va)

return v14.Prefetch

