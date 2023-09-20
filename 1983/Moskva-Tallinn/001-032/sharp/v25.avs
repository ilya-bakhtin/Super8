import("..\1983-Moskva-Tallinn.avs")
v25 = LSMASHVideoSource(dst_dir + "v25rc.mp4")

v25 = v25.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v25 = v25.convertToYV12(interlaced=false)

v25 = v25.deScratch
v25 = v25.removeDirt

v25 = v25.UnsharpMask(strength=500, radius=5, threshold=1)
v25 = v25.adjustBorders

va = BlankClip(v25, audio_rate = 48000, channels = 2).killVideo
v25 = v25.audioDub(va)

return v25.Prefetch

