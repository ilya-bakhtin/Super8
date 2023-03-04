import("..\1983-Moskva-Tallinn.avs")
v22 = LSMASHVideoSource(dst_dir + "v22rc.mp4")

v22 = v22.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v22 = v22.convertToYV12(interlaced=false)

v22 = v22.deScratch
v22 = v22.removeDirt

v22 = v22.UnsharpMask(strength=400, radius=5, threshold=1)
v22 = v22.adjustBorders

va = BlankClip(v22, audio_rate = 48000, channels = 2).killVideo
v22 = v22.audioDub(va)

return v22.Prefetch

