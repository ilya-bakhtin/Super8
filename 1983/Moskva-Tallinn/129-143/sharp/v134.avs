import("..\1983-Moskva-Tallinn.avs")

v134 = LSMASHVideoSource(dst_dir + "v134rc.mp4")

v134 = v134.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v134 = v134.convertToYV12(interlaced=false)

v134 = v134.deScratch
v134 = v134.removeDirt

v134 = v134.UnsharpMask(strength=500, radius=5, threshold=1)
v134 = v134.adjustBorders

va = BlankClip(v134, audio_rate = 48000, channels = 2).killVideo
v134 = v134.audioDub(va)

return v134.Prefetch

