import("..\1983-Moskva-Tallinn.avs")

v143 = LSMASHVideoSource(dst_dir + "v143rc.mp4")

v143 = v143.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v143 = v143.convertToYV12(interlaced=false)

v143 = v143.deScratch
v143 = v143.removeDirt

v143 = v143.UnsharpMask(strength=500, radius=5, threshold=1)
v143 = v143.adjustBorders

va = BlankClip(v143, audio_rate = 48000, channels = 2).killVideo
v143 = v143.audioDub(va)

return v143.Prefetch

