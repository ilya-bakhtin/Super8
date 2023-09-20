import("..\1983-Moskva-Tallinn.avs")
v3 = LSMASHVideoSource(dst_dir + "v3rc.mp4")

v3 = v3.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v3 = v3.convertToYV12(interlaced=false)

v3 = v3.deScratch
v3 = v3.removeDirt

v3 = v3.UnsharpMask(strength=500, radius=5, threshold=1)
v3 = v3.adjustBorders

va = BlankClip(v3, audio_rate = 48000, channels = 2).killVideo
v3 = v3.audioDub(va)

return v3.Prefetch

